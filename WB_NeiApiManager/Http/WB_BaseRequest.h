//
//  WB_BaseRequest.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//  网络请求基类  所有的网络请求继承这个方法

#import "YTKRequest.h"

typedef NS_ENUM(NSInteger,ZorasunRefreshCacheTimeType)
{
    kZorasunRequestCacheTimeTypeNone=1,
    kZorasunRequestCacheTimeTypeShort=2,
    kZorasunRequestCacheTimeTypeLong=3
};

@interface WB_BaseRequest : YTKRequest
/**
 *  获取状态码
 */
-(NSInteger )getCodeStatus;
/**
 *  获取消息
 */
-(NSString * )getMsg;
/**
 *  获取content
 */
-(id)getContent;
/**
 *   缓存时间，二次请求的时候不真的发起请求 defalut 1 none
 */
@property(nonatomic,assign)ZorasunRefreshCacheTimeType cacheTimeType;
@end
