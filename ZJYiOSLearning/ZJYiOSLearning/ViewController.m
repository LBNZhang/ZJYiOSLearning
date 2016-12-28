//
//  ViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/8.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (startAppType == 1) {
        TuiSongViewController* tuisongVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tuisongVC"];
        [self presentViewController:tuisongVC animated:YES completion:^{}];
    }else if (startAppType == 2) {
        TongZhiViewController* tongzhiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tongzhiVC"];
        [self presentViewController:tongzhiVC animated:YES completion:^{}];
    }else if (startAppType == 3) {
        DTouchViewController* dtouchVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"dtouchVC"];
        [self presentViewController:dtouchVC animated:YES completion:^{}];
    }else if (startAppType == 4) {
        FenXiangViewController* fenxiangVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"fenxiangVC"];
        [self presentViewController:fenxiangVC animated:YES completion:^{}];
    }
}

- (IBAction)startAlarmAction:(id)sender {
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        
    } else {
        //创建一个本地推送
        UILocalNotification *noti = [[UILocalNotification alloc] init];
        if (noti) {
            //设置推送时间
            noti.fireDate = [NSDate date];
            //设置时区
            noti.timeZone = [NSTimeZone defaultTimeZone];
            //设置重复间隔
            noti.repeatInterval = kCFCalendarUnitMinute;
            //推送声音
            noti.soundName = UILocalNotificationDefaultSoundName;
            //内容
            noti.alertBody = @"推送内容";
            noti.hasAction = YES;
            //显示在icon上的红色圈中的数子
            noti.applicationIconBadgeNumber += 1;
            //设置通知动作按钮的标题
            noti.alertAction = @"查看";
            //设置userinfo 方便在之后需要撤销的时候使用
            NSDictionary *infoDic = [NSDictionary dictionaryWithObject:@"name" forKey:@"key"];
            noti.userInfo = infoDic;
            //添加推送到uiapplication
            UIApplication *app = [UIApplication sharedApplication];
            [app scheduleLocalNotification:noti];
            //[[UIApplication sharedApplication] presentLocalNotificationNow:noti];
        }
    }
}

- (IBAction)stopAlarmAction:(id)sender {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end
