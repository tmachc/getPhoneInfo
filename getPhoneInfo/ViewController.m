//
//  ViewController.m
//  getPhoneInfo
//
//  Created by 韩冲 on 15/4/5.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "ViewController.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //手机型号。
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    _textView.text = [NSString stringWithFormat:@"%@手机型号：%@\n\n", _textView.text, platform];
    
    //设备相关信息的获取
    NSString *strName = [[UIDevice currentDevice] name];
    _textView.text = [NSString stringWithFormat:@"%@设备名称：%@\n\n", _textView.text, strName];
    NSLog(@"设备名称：%@", strName);//e.g. "My iPhone"
    
    NSString *strSysName = [[UIDevice currentDevice] systemName];
    _textView.text = [NSString stringWithFormat:@"%@系统名称：%@\n\n", _textView.text, strSysName];
    NSLog(@"系统名称：%@", strSysName);// e.g. @"iOS"
    
    NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
    _textView.text = [NSString stringWithFormat:@"%@系统版本号：%@\n\n", _textView.text, strSysVersion];
    NSLog(@"系统版本号：%@", strSysVersion);// e.g. @"4.0"
    
    NSString *strModel = [[UIDevice currentDevice] model];
    _textView.text = [NSString stringWithFormat:@"%@设备模式：%@\n\n", _textView.text, strModel];
    NSLog(@"设备模式：%@", strModel);// e.g. @"iPhone", @"iPod touch"
    
    NSString *strLocModel = [[UIDevice currentDevice] localizedModel];
    _textView.text = [NSString stringWithFormat:@"%@本地设备模式：%@\n\n", _textView.text, strLocModel];
    NSLog(@"本地设备模式：%@", strLocModel);// localized version of model //地方型号  （国际化区域名称）
    
    NSString* phoneModel = [[UIDevice currentDevice] model];
    _textView.text = [NSString stringWithFormat:@"%@手机型号：%@\n\n", _textView.text, phoneModel];
    NSLog(@"手机型号: %@",phoneModel );   //手机型号
    
    
    //app应用相关信息的获取(Info.plist)
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"dicInfo--->>>%@",dicInfo);
    
    NSString *strAppName = [dicInfo objectForKey:@"CFBundleName"];
    _textView.text = [NSString stringWithFormat:@"%@App应用名称：%@\n\n", _textView.text, strAppName];
    NSLog(@"App应用名称：%@", strAppName);   // 当前应用名称
    
    NSString *strAppVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
    _textView.text = [NSString stringWithFormat:@"%@App应用版本：%@\n\n", _textView.text, strAppVersion];
    NSLog(@"App应用版本：%@", strAppVersion);    // 当前应用软件版本  比如：1.0.1
    
    NSString *strAppBuild = [dicInfo objectForKey:@"CFBundleVersion"];
    _textView.text = [NSString stringWithFormat:@"%@App应用Build版本：%@\n\n", _textView.text, strAppBuild];
    NSLog(@"App应用Build版本：%@", strAppBuild);      // 当前应用版本号码   int类型
    
    
    //Getting the User’s Language
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSLog(@"languageArray--->>>%@",languageArray);
    NSString *language = [languageArray objectAtIndex:0];
    _textView.text = [NSString stringWithFormat:@"%@语言：%@\n\n", _textView.text, language];
    NSLog(@"语言：%@", language);//en
    
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    _textView.text = [NSString stringWithFormat:@"%@国家：%@\n\n", _textView.text, country];
    NSLog(@"国家：%@", country); //en_US
}

@end
