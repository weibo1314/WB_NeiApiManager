//
//  WB_BatchUploadImgRequest.m
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WB_BatchUploadImgRequest.h"

#import "WB_UploadImageRequest.h"

@interface WB_BatchUploadImgRequest()

@end

@implementation WB_BatchUploadImgRequest
-(instancetype)initWithImgArray:(NSMutableArray<UIImage *> *)imgArray
{
    NSMutableArray *apiArr = [NSMutableArray new];
    for (NSInteger i = 0; i < imgArray.count; i ++) {
        WB_UploadImageRequest *api = [[WB_UploadImageRequest alloc] initWithImage:imgArray[i]];
        api.tag = i + 1;
        
#pragma mark api获取上传进度的block不能写在这里...
        
        [apiArr addObject:api];
    }
    self = [[WB_BatchUploadImgRequest alloc] initWithRequestArray:apiArr];
    //添加上传进度回调
    [self getBatchProgress];
    return self;
}
-(void)getBatchProgress
{
    for (WB_UploadImageRequest *api in self.requestArray) {
        api.uploadProgressBlock = ^(WB_UploadImageRequest *currentApi, NSProgress *progress) {
            if (_mDelegate&&[_mDelegate respondsToSelector:@selector(upBatchRequestProgressWithApiTag:andProgress:)])
            {
                [_mDelegate upBatchRequestProgressWithApiTag:currentApi.tag andProgress:progress];
            }
        };
    }
}








@end
