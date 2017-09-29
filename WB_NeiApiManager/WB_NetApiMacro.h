//
//  WB_NetApiMacro.h
//  WB_iOS_FrameWork
//
//  Created by weibo on 2017/9/25.
//  Copyright © 2017年 WWB_iOS. All rights reserved.
//

#ifndef WB_NetApiMacro_h
#define WB_NetApiMacro_h

/*
 *   NSlog替代宏  debug调试打印
 */
#ifdef DEBUG
#define WBLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#endif


//网络请求方式
#define GETORPOST 1 // 0  GET  1 POST

/*
 * 正式服务器接口
 */
////////数据请求
#define WB_BASEURL @"http://11.11.111/"
///////图片上传
#define WB_BASEUPLOADIMGURL @"http://11.11.111/"

/*
 * 测试服务器接口
 */
//////////数据请求
//#define WB_BASEURL @"http://47.94.116.6/"
/////////图片上传
//#define WB_BASEUPLOADIMGURL @"http://47.94.116.6/"


#endif /* WB_NetApiMacro_h */
