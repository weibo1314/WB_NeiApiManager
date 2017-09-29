//
//  WB_BatchUploadImgRequest.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//   批量上传图片api

#import "YTKBatchRequest.h"

#import <AVFoundation/AVFoundation.h>
@protocol UpLoadProgressDelegate <NSObject>

//获取批量上传图片进度回调
-(void)upBatchRequestProgressWithApiTag:(NSInteger )apiTag andProgress:(NSProgress *)progress;

@end

@interface WB_BatchUploadImgRequest : YTKBatchRequest

//批量上传图片
-(instancetype)initWithImgArray:(NSMutableArray<UIImage *> *)imgArray;

@property (nonatomic,weak)id<UpLoadProgressDelegate>mDelegate;



@end
