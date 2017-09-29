//
//  WB_ArgumentFilterProtocol.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//    配置共有参数

#import <Foundation/Foundation.h>

#import "YTKNetworkConfig.h"

/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface WB_ArgumentFilterProtocol : NSObject <YTKUrlFilterProtocol>

+ (WB_ArgumentFilterProtocol *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end
