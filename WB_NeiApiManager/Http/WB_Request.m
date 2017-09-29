//
//  WB_Request.m
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/26.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#import "WB_Request.h"

@implementation WB_Request
-(long )getCodeStatus
{
    return [[[self responseJSONObject] objectForKey:@"code"]longValue];
}
-(NSString * )getMsg
{
    return [[self responseJSONObject] objectForKey:@"msg"];
}
-(id)getContent
{
    return  [[self responseJSONObject] objectForKey:@"data"];
}
#pragma mark 请求方式
- (YTKRequestMethod)requestMethod {
    if (GETORPOST == 1) {
        return YTKRequestMethodPOST;
    }else{
        return YTKRequestMethodGET;
    }
}
#pragma mark 添加请求头
-(NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary *headParams=[[NSMutableDictionary alloc]init];
//    [headParams setObject:@"31" forKey:@"accountId"];
//    [headParams setObject:@"2" forKey:@"isUser"];
    return headParams;
}
@end
