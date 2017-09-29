WB_NetApiManager 介绍
=====================

最近闲来无事,整理了前几个项目做得积累的经验...基于YTKNetwork进行再封装,实现TYKNetwork一些基本的使用

因为没有服务器..我就不做demo了  封装的网络请求较为简单想要测一下很简单...并且经历了好几个项目的测试的,,,这个其实就是把之前项目的代码整理起来的...用起来不会出什么问题

入门级封装  各位大大有什么好的意见和建议请联系我

QQ  413151868


## WB_NetApiManager 基本组成


#########注意事项###########
1.PCH要引用     #import "WB_NetApiMacro.h"

2.如果 是http请求  请在info.plist里进行修改  具体修改自行百度

3.AFNetworking可以使用cocopod   但是YTKNetwork不要使用...因为我对YTKNetwork部分代码进行修改例如适配text/html..打印获取的数据等

#pragma mark   -----代码
-------------------------
platform :ios, ‘8.0’

target '项目名称' do

pod 'AFNetworking', '~> 3.0'

end

----------------------------------


WB_NetApiManager 包括以下几个基本的类：

 * WB_ArgumentFilterProtocol 类：用于配置全局参数,比如版本号
 * WB_BaseRequest 类：网络请求基类  所有的网络请求继承这个方法
 * WB_Request 类：继承WB_BaseRequest类    获取数据API的基类，所有获取数据的API 都需要继承于这个方法
 * WB_UploadImageRequest 类：上传图片API的基类，所有上传图片的API 都需要继承于这个方法  如果批量上传图片  请使用下面的类
 * WB_BatchUploadImgRequest 类：批量上传图片api
 * WB_NetApiConstant 类 :  定义全局常量   初始化网络请求api

* WB_NetApiMacro :  配置公共参数


下面简单介绍下网络获取和批量上传图片的使用

### WB_NetApiMacro

配置公共参数

1  请求方式  GET POST
2  统一管理接口地址..方便正式服务器和测试服务器之间的切换  方便开发
3  打印输入的宏写在这里面

### WB_NetApiConstant 类

程序运行是要打开api

```objectivec
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.

self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];

//初始化网络请求
[self initRequest];

[self initWindow];

self.window.backgroundColor = [UIColor whiteColor];
[self.window makeKeyAndVisible];


return YES;
}

#pragma mark ————— 初始化网络请求 —————
-(void)initRequest{

[WB_NetApiConstant sharedInstance];

}

```
### WB_Request 类   获取接口数据继承此类

看代码
1  创建api继承与此类  初始化方法带参数
```objectivec

#import "WB_Request.h"

@interface HomeNetApi : WB_Request


-(id)initWithPageNum:(NSInteger )pagenum;


@end

```
2  配置接口地址和传参
```objectivec
#import "HomeNetApi.h"

@implementation HomeNetApi
{
NSInteger _pagenum;
}
-(id)initWithPageNum:(NSInteger )pagenum
{
    if (self = [super init])
      {
          _pagenum = pagenum;
      }

    return self;
}

###########接口地址#########
-(NSString *)requestUrl
{
    return @"home/index/start";
}
#########传参#############
-(id)requestArgument
{
    return @{
        @"pagenum" :@(_pagenum),
    };
}

@end

```
3  调用api 开始网络请求
```objectivec

HomeNetApi *api = [[HomeNetApi alloc] initWithPageNum:0];
[api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {

} failure:^(__kindof YTKBaseRequest * _Nonnull request) {

}];

```

### WB_BatchUploadImgRequest 类   批量上传图片


批量上传图片只有一个方法..实现就好  如果有获取每一张上传图片的上传进度...有一个代理实现就可以实时获取上传进度

看代码

1  实现初始化方法  :   -(instancetype)initWithImgArray:(NSMutableArray<UIImage *> *)imgArray;

```objectivec
    NSMutableArray *arr = [NSMutableArray arrayWithObject:_img.image];
    [arr addObject:_second.image];
    WB_BatchUploadImgRequest *api = [[WB_BatchUploadImgRequest alloc] initWithImgArray:arr];
    api.mDelegate = self;
    [api startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
        NSLog(@"succeed");
        //图片上传成功
        NSArray *requests = batchRequest.requestArray;
        //获取每张图片返回的图片名
        WB_UploadImageRequest *api = (WB_UploadImageRequest *)requests[0];
        [api getContent];
    } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
        NSLog(@"failed");
    }];

```

2  代理获取上传进度  实现代理方法   -(void)upBatchRequestProgressWithApiTag:(NSInteger )apiTag andProgress:(NSProgress *)progress;
```objectivec

-(void)upBatchRequestProgressWithApiTag:(NSInteger )apiTag andProgress:(NSProgress *)progress
  {
      NSLog(@"第%ld张图片加载了%.2f------------",apiTag,progress.fractionCompleted);
  }

```



## 其他说明
      请求头   在WB_Request类里第32行添加请求头
      
      
      网络请求的处理和断网提醒在YTKNetworkAgent的第670-700行
      
      关于数据返回要提一句  为了方便开发   网络请求成功会返回对应的jsonStr和相对应的字典转成的属性
      
      创建model后吧需要的属性粘贴进去就好..大大节省了开发时间
      
      
      下面是打印的效果  会打印出每一个字段对应的属性  用的是否直接粘贴就好


```  控制台
    2017-09-28 12:05:13.700320+0800 WB_iOS_FrameWork[3677:299879]
    @property (nonatomic ,copy) NSString *time;

    @property (nonatomic ,copy) NSString *appModel;

    @property (nonatomic ,copy) NSString *title;

    @property (nonatomic ,copy) NSString *name;

    @property (nonatomic ,copy) NSString *adPic;

    @property (nonatomic ,copy) NSString *seller_id;
    2017-09-28 12:05:13.700637+0800 WB_iOS_FrameWork[3677:299879]
    @property (nonatomic ,copy) NSString *title;

    @property (nonatomic ,copy) NSString *icon;

    @property (nonatomic ,copy) NSString *type;
```





以上几个示例代码在 Demo 工程中也可获得。
