//
//  WB_UploadImageRequest.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//   上传图片API的基类，所有上传图片的API 都需要继承于这个方法

#import "WB_Request.h"

#import <AVFoundation/AVFoundation.h>

@interface WB_UploadImageRequest : WB_Request

@property(nonatomic,strong)UIImage *image;

- (id)initWithImage:(UIImage *)image;

//获取上传进度
@property(nonatomic,copy)void(^uploadProgressBlock)(WB_UploadImageRequest *currentApi, NSProgress * progress);



@end
