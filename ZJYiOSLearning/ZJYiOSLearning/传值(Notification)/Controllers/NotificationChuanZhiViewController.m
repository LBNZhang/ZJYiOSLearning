//
//  NotificationChuanZhiViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/28.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "NotificationChuanZhiViewController.h"

@interface NotificationChuanZhiViewController ()

@end

@implementation NotificationChuanZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //功能是第一个页面点击按钮跳转到第二个页面，第二个页面在textfield上输入东西点击按钮后返回第一个页面并在label上显示输入的内容
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:@"test" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
   
}

- (void) test:(NSNotification*) notification {
    NSString* string = [notification object];//通过这个获取到传递的对象
    self.lbl.text = string;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


@end
