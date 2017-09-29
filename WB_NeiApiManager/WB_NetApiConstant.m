//
//  WB_NetApiConstant.m
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#import "WB_NetApiConstant.h"

#import "YTKNetworkConfig.h"

@implementation WB_NetApiConstant
static WB_NetApiConstant *Const = nil;
+ (WB_NetApiConstant *)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        Const = [[self alloc] init];
        
    });
    return Const;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
        //请求的基础url前缀
        config.baseUrl = WB_BASEURL;
        //图片上传url前缀
        _imageUpLoadPrefix = WB_BASEUPLOADIMGURL;
    }
    return self;
}


@end
