# cordova-XJMapSDK-demo

cordova-XJMapSDK-demo 是一套面向 cordova 开发者使用XJMapSDK的demo工程，里面包含一个自定义插件cordova-plugin-XJMapSDK（目前插件暂未上传cordova），
开发者可自行引用该插件轻松实现地图展示、导航至具体poi等功能

## 获取AppKey
暂无

## 插件引用
拷贝插件文件夹至项目目录 (相对路径)
```bash
cordova plugin add ./cordova-plugin-XJMapSDK
```

### 注意
添加该插件之后，ios会自动使用pod下载关联SDK（XJMapSDK）
  
## 使用说明  

### SDK初始化
  在 didFinishLaunchingWithOptions里面添加以下代码即可，appKey为邮件中获取的
```objective-c
    //初始化XJMap
    [XJMapServices setAppKey:appKey];
    [[XJMapServices sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
```


### 显示室内地图
在js中调用该方法并传入地图参数
```js
  cordova.plugins.XJMapSDKPlugin.showMap("3aBi8Pl1oy");
```
### 导航至具体地址
```js
  cordova.plugins.XJMapSDKPlugin.naviTo( "3aBi8Pl1oy", "服务台", "10000");
```
### 是否在地图范围内的接口
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.manger = [XJMapLocationManger new];
    self.manger.locationTimeOut = 20;
    self.manger.delegate = self;
    
    [self.manger startLocationEngine:@"3aBi8Pl1oy"];
}

- (void)xjmapLocationManager:(XJMapLocationManger *_Nullable)manager didUpdateLocation:(XJLocationInfo *_Nullable)location 
{
    if (location.inThisMap) {
        NSLog(@"在医院里面");
    }
}
```
	
