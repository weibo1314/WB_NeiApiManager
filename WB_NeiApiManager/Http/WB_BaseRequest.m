//
//  WB_BaseRequest.m
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#import "WB_BaseRequest.h"

@implementation WB_BaseRequest
-(id)init
{
    self=[super init];
    if (self) {
        if (self.cacheTimeType == 0) {
            self.cacheTimeType=kZorasunRequestCacheTimeTypeNone;
        }
    }
    return self;
}
-(NSInteger )getCodeStatus
{
    return 0;
}
-(NSString * )getMsg
{
    return nil;
}
-(id)getContent
{
    return  nil;
}
#pragma mark 缓存时间，二次请求的时候不真的发起请求 ,如果需要其他缓存时间的请求，进行覆盖
-(NSInteger)cacheTimeInSeconds
{
    NSInteger seconds=0;
    switch (_cacheTimeType) {
        case kZorasunRequestCacheTimeTypeLong:
            seconds=60*5;
            break;
        case kZorasunRequestCacheTimeTypeShort:
            seconds= 60*1;
            break;
        case kZorasunRequestCacheTimeTypeNone:
        default:
            break;
    }
    return seconds;
}

@end
