# 获取手机基本信息
iOS获取手机基本信息

```
#include <sys/types.h>
#include <sys/sysctl.h>

//手机型号。
size_t size;
sysctlbyname("hw.machine", NULL, &size, NULL, 0);
char *machine = (char*)malloc(size);
sysctlbyname("hw.machine", machine, &size, NULL, 0);
NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
```

UIDevice所做的工作就是为应用程序提供用户及设备的一些信息。
```
NSString *strName = [[UIDevice currentDevice] name];  
NSLog(@"设备名称：%@", strName);//e.g. "My iPhone"  

NSString *strId = [[UIDevice currentDevice] uniqueIdentifier];  
NSLog(@"设备唯一标识：%@", strId);//UUID,5.0后不可用  

NSString *strSysName = [[UIDevice currentDevice] systemName];  
NSLog(@"系统名称：%@", strSysName);// e.g. @"iOS"  

NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];  
NSLog(@"系统版本号：%@", strSysVersion);// e.g. @"4.0"  

NSString *strModel = [[UIDevice currentDevice] model];  
NSLog(@"设备模式：%@", strModel);// e.g. @"iPhone", @"iPod touch"  

NSString *strLocModel = [[UIDevice currentDevice] localizedModel];  
NSLog(@"本地设备模式：%@", strLocModel);// localized version of model //地方型号  （国际化区域名称）  

NSString* phoneModel = [[UIDevice currentDevice] model];  
NSLog(@"手机型号: %@",phoneModel );   //手机型号
```

从Info.plist可以读取许多APP的相关信息
```
//app应用相关信息的获取(Info.plist)  
NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];  
  
NSString *strAppName = [dicInfo objectForKey:@"CFBundleDisplayName"];  
NSLog(@"App应用名称：%@", strAppName);   // 当前应用名称  
  
NSString *strAppVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];  
NSLog(@"App应用版本：%@", strAppVersion);    // 当前应用软件版本  比如：1.0.1    
  
NSString *strAppBuild = [dicInfo objectForKey:@"CFBundleVersion"];  
NSLog(@"App应用Build版本：%@", strAppBuild);      // 当前应用版本号码   int类型
```

NSLocale可以获取用户的本地化信息设置
```
NSArray *languageArray = [NSLocale preferredLanguages];  
NSString *language = [languageArray objectAtIndex:0];  
NSLog(@"语言：%@", language);//en  
  
NSLocale *locale = [NSLocale currentLocale];  
NSString *country = [locale localeIdentifier];  
NSLog(@"国家：%@", country); //en_US 
```
