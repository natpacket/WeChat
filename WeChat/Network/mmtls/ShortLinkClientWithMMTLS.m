

//
//  ShortLink.m
//  WXDemo
//
//  Created by ray on 2018/12/4.
//  Copyright © 2018 ray. All rights reserved.
//

#import "ShortLinkClientWithMMTLS.h"
#import <ASIHTTPRequest.h>

#import "ShortLinkWithMMTLS.h"
#import "MMTLSShortLinkResponse.h"

#import "DefaultShortIp.h"

@interface ShortLinkClientWithMMTLS ()

@property (nonatomic, strong) NSData *decryptedPart2;
@property (nonatomic, strong) NSData *resumptionSecret;

@end

@implementation ShortLinkClientWithMMTLS

- (instancetype)initWithDecryptedPart2:(NSData *)decryptedPart2 resumptionSecret:(NSData *)resumptionSecret
{
    self = [super init];
    if (self)
    {
        _decryptedPart2 = decryptedPart2;
        _resumptionSecret = resumptionSecret;
    }
    return self;
}

+ (NSData *)mmPost:(NSData *)mmtlsData withHost:(NSString *)headerHost
{
    time_t t = time(NULL);
    srand((unsigned int) t);
    unsigned long long r = rand();

    DefaultShortIp *randomIP = [DefaultShortIp getARandomIp];
    NSString *ip = @"short.weixin.qq.com";
    if (randomIP != nil) {
        ip = randomIP.ip;
        LogVerbose(@"ShortIP from default dns: %@", ip);
    }
    
    do {
        WCBuiltinIP *randomBuiltinIp = [WCBuiltinIP getARandomShortBuiltinIP];
        if (randomBuiltinIp != nil) {
            ip = randomBuiltinIp.ip;
            LogVerbose(@"ShortIP from builtin dns: %@", ip);
        }
    } while ([ip isEqualToString:@"127.0.0.1"]);
    
    NSString *host = [NSString stringWithFormat:@"http://%@", ip];//183.192.199.147 //163.177.81.139 //183.3.224.141 //117.184.242.101 163.177.81.139
    NSString *urlstr = [NSString stringWithFormat:@"%@/%@", host, [NSString stringWithFormat:@"mmtls/%08llx", r]];

    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlstr]];
    [request addRequestHeader:@"Accept" value:@"*/*"];
    [request addRequestHeader:@"Cache-Control" value:@"no-cache"];
    [request addRequestHeader:@"Connection" value:@"close"];
    [request addRequestHeader:@"Content-Type" value:@"application/octet-stream"];
    [request addRequestHeader:@"Host" value:headerHost];
    [request addRequestHeader:@"User-Agent" value:@"MicroMessenger Client"];
    [request addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%ld", [mmtlsData length]]];
    [request addRequestHeader:@"Upgrade" value:@"mmtls"];

    [request setAllowCompressedResponse:NO];
    [request setRequestMethod:@"POST"];
    [request setPostBody:[mmtlsData mutableCopy]];
    [request setTimeOutSeconds:30];
    
    [request startSynchronous];

    NSError *error = [request error];
    if (error)
    {
        LogError(@"Error: %@", error);
    }

    return [request responseData];
}

+ (NSData *)getPayloadDataWithData:(NSData *)shortlinkData
                           cgiPath:(NSString *)cgiPath
                              host:(NSString *)host
{
    NSData *cgiPathLen = [NSData packInt16:[cgiPath length] flip:YES];
    NSData *shortlinkDataLen = [NSData packInt32:(int32_t)[shortlinkData length] flip:YES];
    NSData *payloadData = [cgiPathLen addDataAtTail:[cgiPath dataUsingEncoding:NSUTF8StringEncoding]];

    NSData *hostLen = [NSData packInt16:[host length] flip:YES];
    payloadData = [payloadData addDataAtTail:hostLen];
    payloadData = [payloadData addDataAtTail:[host dataUsingEncoding:NSUTF8StringEncoding]];

    payloadData = [payloadData addDataAtTail:shortlinkDataLen];
    payloadData = [payloadData addDataAtTail:shortlinkData];

    NSData *len4 = [NSData packInt32:(int32_t)[payloadData length] flip:YES];
    payloadData = [len4 addDataAtTail:payloadData];

    return payloadData;
}

+ (NSData *)post:(NSData *)sendData toCgiPath:(NSString *)cgiPath
{
    NSData *httpPayloadData =
        [ShortLinkClientWithMMTLS getPayloadDataWithData:sendData
                                                 cgiPath:cgiPath
                                                    host:@"szextshort.weixin.qq.com"];

    ShortLinkWithMMTLS *slm =
        [[ShortLinkWithMMTLS alloc] initWithDecryptedPart2:[WeChatClient sharedClient].pskData
                                          resumptionSecret:[WeChatClient sharedClient].resumptionSecret
                                                  httpData:httpPayloadData];

    NSData *mmtlsData = [slm getSendData];
    NSData *httpResponseBody = [ShortLinkClientWithMMTLS mmPost:mmtlsData withHost:@"szextshort.weixin.qq.com"];

    MMTLSShortLinkResponse *response = [[MMTLSShortLinkResponse alloc] initWithData:httpResponseBody];
    NSData *packData = [slm receiveData:response];
    
    return packData;
}

@end
