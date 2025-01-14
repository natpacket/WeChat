//
//  mmpack.m
//  WeChat
//
//  Created by ray on 2018/12/20.
//  Copyright © 2018 ray. All rights reserved.
//

#import "mmpack.h"

#import "ShortPackage.h"
#import "Cookie.h"
#import "Varint128.h"
#import "NSData+Compression.h"
#import "NSData+AES.h"
#import "CalRqtAlg.h"

@implementation mmpack

+ (NSData *)EncodeHybirdEcdhEncryptPack:(int)cgi
                          serilizedData:(NSData *)hybridEncrypedData
                                    uin:(uint32_t)uin
                                 cookie:(NSData *)cookie
                             rsaVersion:(int)rsaVersion {

    int bodyDataLen = (int) [hybridEncrypedData length];
    int compressedBodyDataLen = (int) [hybridEncrypedData length];

    NSMutableData *header = [NSMutableData data];

    [header appendData:[NSData dataWithHexString:@"bf"]];   //固定
    [header appendData:[NSData dataWithHexString:@"00"]];   //包头长度及是否使用压缩，最后计算。
    int len = (0xc << 4) + (cookie != nil ? 0xf : 0x0);     //加密算法及是否使用cookie： 0xc=HybirdEcdhEncrypt
    [header appendData:[NSData dataWithHexString:[NSString stringWithFormat:@"%2x", len]]];
    [header appendData:[NSData packInt32:CLIENT_VERSION flip:YES]];
    [header appendData:[NSData packInt32:uin flip:YES]];

    if (cookie) [header appendData:cookie];

    [header appendData:[Varint128 dataWithUInt32:cgi]];
    [header appendData:[Varint128 dataWithUInt32:bodyDataLen]];
    [header appendData:[Varint128 dataWithUInt32:compressedBodyDataLen]];
    [header appendData:[Varint128 dataWithUInt32:rsaVersion]];

    [header appendData:[NSData dataWithHexString:@"02"]];
    
    [header appendData:[NSData dataWithHexString:@"00"]];
    [header appendData:[NSData dataWithHexString:@"fe"]];

    // cal rqt 
    int rqt = [CalRqtAlg calRqtData:hybridEncrypedData cmd:1 uin:1];
    NSData *rqtData = [Varint128 dataWithUInt32:rqt];
    [header appendData:rqtData];
   
    [header appendData:[NSData dataWithHexString:@"00"]];

    NSData *headerLen = [NSData dataWithHexString:[NSString stringWithFormat:@"%2x", (int) ((
            [header length] << 2) + 0x2)]]; //0x2 !use_compress
    [header replaceBytesInRange:NSMakeRange(1, 1) withBytes:[headerLen bytes]];

    [header appendData:hybridEncrypedData];

    return [header copy];
}

// flag = 7 是前台
+ (NSData *)EncodePack:(int)cgi
         serilizedData:(NSData *)serilizedData
                   uin:(uint32_t)uin
                aesKey:(NSData *)aesKey
                cookie:(NSData *)cookie
             signature:(int)signature
                  flag:(int)flag
{
    int bodyDataLen = (int) [serilizedData length];
    NSData *compressData = [serilizedData dataByDeflating];
    int compressedBodyDataLen = (int) [compressData length];

    BOOL useCompress = NO;
    NSData *aesedData = nil;
    if (compressedBodyDataLen >= bodyDataLen) {
        useCompress = NO;
        aesedData = [serilizedData AES_CBC_encryptWithKey:aesKey];
    } else {
        useCompress = YES;
        aesedData = [compressData AES_CBC_encryptWithKey:aesKey];
    }

    NSMutableData *header = [NSMutableData data];

    [header appendData:[NSData dataWithHexString:@"bf"]];   //固定
    [header appendData:[NSData dataWithHexString:@"00"]];   //包头长度及是否使用压缩，最后计算。
    int len = (0x5 << 4) + (cookie != nil ? 0xf : 0x0);     //加密算法及是否使用cookie： 0x5=aes
    [header appendData:[NSData dataWithHexString:[NSString stringWithFormat:@"%2x", len]]];
    [header appendData:[NSData packInt32:CLIENT_VERSION flip:YES]];
    [header appendData:[NSData packInt32:uin flip:YES]];

    if (cookie) [header appendData:cookie];

    [header appendData:[Varint128 dataWithUInt32:cgi]];
    [header appendData:[Varint128 dataWithUInt32:bodyDataLen]];
    [header appendData:[Varint128 dataWithUInt32:(useCompress ? compressedBodyDataLen : bodyDataLen)]];

    [header appendData:[Varint128 dataWithUInt32:0]];
    [header appendData:[Varint128 dataWithUInt32:2]];
    [header appendData:[Varint128 dataWithUInt32:signature]];//checksum
    if (flag == 6) {
        [header appendData:[NSData dataWithHexString:@"fe"]]; //ios ff //flags=7时是前台(ff)，=6时是后台(fe)
    } else if (flag == 7) {
        [header appendData:[NSData dataWithHexString:@"ff"]]; //ios ff //flags=7时是前台(ff)，=6时是后台(fe)
    } else {
        [header appendData:[NSData dataWithHexString:@"ff"]]; //ios ff //flags=7时是前台(ff)，=6时是后台(fe)
    }

    int rqt = [CalRqtAlg calRqtData:aesedData cmd:1 uin:1];
    NSData *rqtData = [Varint128 dataWithUInt32:rqt];
    [header appendData:rqtData];
    
    [header appendData:[NSData dataWithHexString:@"00"]];
    
    NSData *headerLen = [NSData dataWithHexString:[NSString stringWithFormat:@"%2x", (int) ((
            [header length] << 2) + (useCompress ? 1 : 2))]];
    [header replaceBytesInRange:NSMakeRange(1, 1) withBytes:[headerLen bytes]];
    [header appendData:aesedData];

    return [header copy];
}

+ (ShortPackage *)DecodePack:(NSData *)body {
    ShortPackage *package = [ShortPackage new];
    ShortHeader *shortHeader = [ShortHeader new];

    package.header = shortHeader;
    if ([body length] < 0x20) {
        LogError(@"DecodePack BF Fail, Body too short: %@", body);
        return nil;
    }

    UInt32 index = 0;
    int mark = (int) [body toInt8ofRange:index];
    if (mark == 0xbf) {
        index++;
    }

    int32_t headLength = (int) [body toInt8ofRange:index] >> 2;
    shortHeader.compressed = (1 == ((int) [body toInt8ofRange:index] & 0x3));
    index++;

    shortHeader.decrytType = (int) [body toInt8ofRange:index] >> 4;
    int cookieLen = (int) [body toInt8ofRange:index] & 0xf;
    index++;
    index += 4; //服务器版本，忽略。

    package.uin = (int) [body toInt8ofRange:index];
    index += 4;

    if (cookieLen > 0 && cookieLen <= 0xf) {
        NSData *cookie = [body subdataWithRange:NSMakeRange(index, cookieLen)];
        LogVerbose(@"Cookie: %@", cookie);
        index += cookieLen;

        [WeChatClient sharedClient].cookie = cookie;
        if (cookieLen > 6) [DBManager saveCookie:cookie];
    } else if (cookieLen > 0xf) {
        LogError(@"UnPack BF Fail, cookieLen too long.");
        return nil;
    }

    shortHeader.cgi = [Varint128 decode32FromBytes:[body bytes] offset:&index];
    [Varint128 decode32FromBytes:[body bytes] offset:&index];   //int protobufLen
    [Varint128 decode32FromBytes:[body bytes] offset:&index];   //int compressedLen =

    if (headLength < [body length]) {
        package.body = [body subdataWithRange:NSMakeRange(headLength, [body length] - headLength)];
    }

    return package;
}

@end
