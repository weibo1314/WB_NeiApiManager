//
//  WB_NetApiConstant.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//   定义全局常量   启动api

#import <Foundation/Foundation.h>

@interface WB_NetApiConstant : NSObject

+ (WB_NetApiConstant *)sharedInstance;

//图片上传地址 前缀
@property(nonatomic,copy)NSString *imageUpLoadPrefix;



@end
