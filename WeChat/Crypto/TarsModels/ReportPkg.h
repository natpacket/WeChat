// **********************************************************************
// This file was generated by a TARS parser!
// TARS version 1.1.0.
// **********************************************************************

#import <tup/tup.h>

@interface ReportPkg : TarsObjectV2

@property (nonatomic, assign, JV2_PROP_GS_V2(index,setIndex:)) TarsInt32 JV2_PROP_NM(r,0,index);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTu,setBTu:)) TarsInt8 JV2_PROP_NM(o,1,BTu);
@property (nonatomic, retain, JV2_PROP_GS_V2(packageName,setPackageName:)) NSString* JV2_PROP_NM(o,2,packageName);
@property (nonatomic, retain, JV2_PROP_GS_V2(signature,setSignature:)) NSData* JV2_PROP_NM(o,3,signature);
@property (nonatomic, assign, JV2_PROP_GS_V2(fileSize,setFileSize:)) TarsInt64 JV2_PROP_NM(o,4,fileSize);
@property (nonatomic, retain, JV2_PROP_GS_V2(applicationLabel,setApplicationLabel:)) NSString* JV2_PROP_NM(o,5,applicationLabel);
@property (nonatomic, assign, JV2_PROP_GS_V2(versionCode,setVersionCode:)) TarsInt32 JV2_PROP_NM(o,6,versionCode);
@property (nonatomic, retain, JV2_PROP_GS_V2(versionName,setVersionName:)) NSString* JV2_PROP_NM(o,7,versionName);
@property (nonatomic, assign, JV2_PROP_GS_V2(appSourceFlag,setAppSourceFlag:)) TarsInt32 JV2_PROP_NM(o,8,appSourceFlag);
@property (nonatomic, retain, JV2_PROP_GS_V2(BTC,setBTC:)) NSString* JV2_PROP_NM(o,9,BTC);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTD,setBTD:)) TarsInt32 JV2_PROP_NM(r,10,BTD);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTE,setBTE:)) TarsInt32 JV2_PROP_NM(o,11,BTE);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTF,setBTF:)) TarsInt32 JV2_PROP_NM(o,12,BTF);
@property (nonatomic, retain, JV2_PROP_GS_V2(BTG,setBTG:)) NSArray* JV2_PROP_EX(o,13,BTG,VONSNumber);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTH,setBTH:)) TarsInt32 JV2_PROP_NM(o,14,BTH);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTI,setBTI:)) TarsBool JV2_PROP_NM(r,15,BTI);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTJ,setBTJ:)) TarsInt32 JV2_PROP_NM(o,16,BTJ);
@property (nonatomic, assign, JV2_PROP_GS_V2(BTK,setBTK:)) TarsInt32 JV2_PROP_NM(r,17,BTK);
@property (nonatomic, retain, JV2_PROP_GS_V2(extractPkgCertMd5s,setExtractPkgCertMd5s:)) NSData* JV2_PROP_NM(o,18,extractPkgCertMd5s);

@end