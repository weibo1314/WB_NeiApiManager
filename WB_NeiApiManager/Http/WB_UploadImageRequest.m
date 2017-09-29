//
//  WB_UploadImageRequest.m
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#import "WB_UploadImageRequest.h"

#import "AFNetworking.h"

#import "WB_NetApiConstant.h"

@implementation WB_UploadImageRequest
- (id)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.image = image;
       self.resumableDownloadProgressBlock = [self resumableUploadProgressBlock];
    }
    return self;
}
-(NSString *)baseUrl
{
    return [[WB_NetApiConstant sharedInstance] imageUpLoadPrefix];
}
- (YTKRequestMethod)requestMethod {
    if (GETORPOST == 1) {
        return YTKRequestMethodPOST;
    }else{
        return YTKRequestMethodGET;
    }
}
- (NSString *)requestUrl {
    return @"home/upImg";
}
//设置上传图片 所需要的 HTTP HEADER
- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data=UIImagePNGRepresentation(_image);
        NSString *name = @"urlfile";
        NSString *fileName=@"";
        NSDate* date = [NSDate date];
        NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
        [dateformatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *timeStr=[dateformatter stringFromDate:date];
        fileName=[NSString stringWithFormat:@"%@.png",timeStr];
        NSString *type = @"image/png";
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
    };
}
#pragma mark 上传进度
- (AFURLSessionTaskProgressBlock) resumableUploadProgressBlock
{
    AFURLSessionTaskProgressBlock block = ^void(NSProgress * progress){
        if (_uploadProgressBlock) {
            _uploadProgressBlock(self,progress);
        }
    };
    return block;
}

@end
