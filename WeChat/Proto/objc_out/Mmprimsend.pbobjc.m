// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: mmprimsend.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "Mmprimsend.pbobjc.h"
#import "Mmbuiltintype.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - MmprimsendRoot

@implementation MmprimsendRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - MmprimsendRoot_FileDescriptor

static GPBFileDescriptor *MmprimsendRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"micromsg"
                                                     syntax:GPBFileSyntaxProto2];
  }
  return descriptor;
}

#pragma mark - MicroMsgRequestNew

@implementation MicroMsgRequestNew

@dynamic hasToUserName, toUserName;
@dynamic hasContent, content;
@dynamic hasType, type;
@dynamic hasCreateTime, createTime;
@dynamic hasClientMsgId, clientMsgId;
@dynamic hasMsgSource, msgSource;
@dynamic hasCtrlBit, ctrlBit;

typedef struct MicroMsgRequestNew__storage_ {
  uint32_t _has_storage_[1];
  uint32_t type;
  uint32_t createTime;
  uint32_t clientMsgId;
  uint32_t ctrlBit;
  SKBuiltinString_t *toUserName;
  NSString *content;
  NSString *msgSource;
} MicroMsgRequestNew__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "toUserName",
        .dataTypeSpecific.className = GPBStringifySymbol(SKBuiltinString_t),
        .number = MicroMsgRequestNew_FieldNumber_ToUserName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, toUserName),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "content",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_Content,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, content),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_Type,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "createTime",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_CreateTime,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, createTime),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "clientMsgId",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_ClientMsgId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, clientMsgId),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "msgSource",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_MsgSource,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, msgSource),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "ctrlBit",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgRequestNew_FieldNumber_CtrlBit,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(MicroMsgRequestNew__storage_, ctrlBit),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[MicroMsgRequestNew class]
                                     rootClass:[MmprimsendRoot class]
                                          file:MmprimsendRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(MicroMsgRequestNew__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\007\001J\000\002G\000\003D\000\004J\000\005K\000\006I\000\007G\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SendMsgRequestNew

@implementation SendMsgRequestNew

@dynamic hasCount, count;
@dynamic listArray, listArray_Count;

typedef struct SendMsgRequestNew__storage_ {
  uint32_t _has_storage_[1];
  uint32_t count;
  NSMutableArray *listArray;
} SendMsgRequestNew__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "count",
        .dataTypeSpecific.className = NULL,
        .number = SendMsgRequestNew_FieldNumber_Count,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SendMsgRequestNew__storage_, count),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(MicroMsgRequestNew),
        .number = SendMsgRequestNew_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SendMsgRequestNew__storage_, listArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SendMsgRequestNew class]
                                     rootClass:[MmprimsendRoot class]
                                          file:MmprimsendRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SendMsgRequestNew__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\001E\000\002\000List\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - MicroMsgResponseNew

@implementation MicroMsgResponseNew

@dynamic hasRet, ret;
@dynamic hasToUserName, toUserName;
@dynamic hasMsgId, msgId;
@dynamic hasClientMsgId, clientMsgId;
@dynamic hasCreateTime, createTime;
@dynamic hasServerTime, serverTime;
@dynamic hasType, type;
@dynamic hasNewMsgId, newMsgId;

typedef struct MicroMsgResponseNew__storage_ {
  uint32_t _has_storage_[1];
  int32_t ret;
  uint32_t msgId;
  uint32_t clientMsgId;
  uint32_t createTime;
  uint32_t serverTime;
  uint32_t type;
  SKBuiltinString_t *toUserName;
  uint64_t newMsgId;
} MicroMsgResponseNew__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "ret",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_Ret,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, ret),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "toUserName",
        .dataTypeSpecific.className = GPBStringifySymbol(SKBuiltinString_t),
        .number = MicroMsgResponseNew_FieldNumber_ToUserName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, toUserName),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "msgId",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_MsgId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, msgId),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "clientMsgId",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_ClientMsgId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, clientMsgId),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "createTime",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_CreateTime,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, createTime),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "serverTime",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_ServerTime,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, serverTime),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_Type,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "newMsgId",
        .dataTypeSpecific.className = NULL,
        .number = MicroMsgResponseNew_FieldNumber_NewMsgId,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(MicroMsgResponseNew__storage_, newMsgId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[MicroMsgResponseNew class]
                                     rootClass:[MmprimsendRoot class]
                                          file:MmprimsendRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(MicroMsgResponseNew__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\010\001C\000\002J\000\003E\000\004K\000\005J\000\006J\000\007D\000\010H\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SendMsgResponseNew

@implementation SendMsgResponseNew

@dynamic hasBaseResponse, baseResponse;
@dynamic hasCount, count;
@dynamic listArray, listArray_Count;

typedef struct SendMsgResponseNew__storage_ {
  uint32_t _has_storage_[1];
  uint32_t count;
  BaseResponse *baseResponse;
  NSMutableArray *listArray;
} SendMsgResponseNew__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "baseResponse",
        .dataTypeSpecific.className = GPBStringifySymbol(BaseResponse),
        .number = SendMsgResponseNew_FieldNumber_BaseResponse,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SendMsgResponseNew__storage_, baseResponse),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "count",
        .dataTypeSpecific.className = NULL,
        .number = SendMsgResponseNew_FieldNumber_Count,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SendMsgResponseNew__storage_, count),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(MicroMsgResponseNew),
        .number = SendMsgResponseNew_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SendMsgResponseNew__storage_, listArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SendMsgResponseNew class]
                                     rootClass:[MmprimsendRoot class]
                                          file:MmprimsendRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SendMsgResponseNew__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\003\001L\000\002E\000\003\000List\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)