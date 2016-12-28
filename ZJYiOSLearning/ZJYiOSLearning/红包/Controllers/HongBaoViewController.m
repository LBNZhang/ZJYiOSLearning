//
//  HongBaoViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/7.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "HongBaoViewController.h"

@interface HongBaoViewController ()

@end

@implementation HongBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HongBaoView* hongbaoView = [[HongBaoView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:hongbaoView];
    NSLog(@"");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
