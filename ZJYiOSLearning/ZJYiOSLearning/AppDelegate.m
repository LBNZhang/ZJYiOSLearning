//
//  AppDelegate.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/8.
//  现改为集成推送，本地通知，3dtouch,链接分享的工程，且每个功能都可以跳转到指定页面上
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "UMessage.h"
#import "Global.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    Boolean isStartedOrNot;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Global setupGlobalVariable];
    NSLog(@"%@调用了%s方法",[self class],__func__);
    //上传统计数据,NSUserDefaults是单例
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSInteger tongjiNo = [[ud objectForKey:@"tongjiNo"] integerValue];
    NSLog(@"点击数据为%ld",(long)tongjiNo);
    //上传后清空
    
    //设置 AppKey 及 LaunchOptions
    [UMessage startWithAppkey:@"57f87b5c67e58e6dde00236d" launchOptions:launchOptions];
    
    //1.3.0版本开始简化初始化过程。如不需要交互式的通知，下面用下面一句话注册通知即可。
    [UMessage registerForRemoteNotifications];
    
    [UMessage setLogEnabled:YES];
    
    /** 定义 shortcutItem  */
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"item1@3x.png"];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"科目一" localizedSubtitle:@"参加科目一练习" icon:icon1 userInfo:nil];
    /** 将items 添加到app图标 */
    application.shortcutItems = @[item1];
    
    isStartedOrNot = YES;

    if (launchOptions) {
        if([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) {
            startAppType = 1;
        } else if ([launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey]) {
            startAppType = 2;
        } else if ([launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey]) {
            startAppType = 3;
        } else if ([launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) {
            startAppType = 4;
        }
    }
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //推送
    [UMessage didReceiveRemoteNotification:userInfo];
    
    if (isStartedOrNot) {
        //直接跳转
        TuiSongViewController* tuisongVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tuisongVC"];
        [[Global getLastNavigationController] pushViewController:tuisongVC animated:YES];
    }
}

//本地通知
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    startAppType = 2;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"接收到本地提醒 in app" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        //直接跳转l
        TongZhiViewController* tongzhiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tongzhiVC"];
        [[Global getLastNavigationController] pushViewController:tongzhiVC animated:YES];
    }]];
    [[Global getCurrentViewController] presentViewController:alertController animated:YES completion:nil];
    
    //这里，你就可以通过notification的useinfo，干一些你想做的事情了
    //application.applicationIconBadgeNumber -= 1;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                  stringByReplacingOccurrencesOfString: @">" withString: @""]
                 stringByReplacingOccurrencesOfString: @" " withString: @""]);
}

#pragma mark -  3D touch 代理方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
{
    if (isStartedOrNot) {
        //直接跳转
        DTouchViewController* dtouchVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"dtouchVC"];
        [[Global getLastNavigationController] pushViewController:dtouchVC animated:YES];
    }
}
//告诉代理进程启动但还没进入状态保存
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return YES;
}
//当应用程序将要入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
//当应用程序入活动状态执行，这个刚好跟上面那个方法相反
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
//当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
//当程序从后台将要重新回到前台时候调用，这个刚好跟上面的那个方法相反。
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
//当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
//当程序载入后执行
- (void)applicationDidFinishLaunching:(UIApplication*)application{
    NSLog(@"%@调用了%s方法",[self class],__func__);
}

//支付宝方法
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            NSInteger resultInteger = [[resultDic objectForKey:@"resultStatus"] integerValue];
            if (resultInteger == 9000) {
                NSLog(@"支付是成功的！！！！！！");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alipay" object:@"chenggong"];
            }else {
                NSLog(@"支付是失败的！！！！！！");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alipay" object:@"shibai"];
            }
            
        }];
    }
    return YES;
}
@end
