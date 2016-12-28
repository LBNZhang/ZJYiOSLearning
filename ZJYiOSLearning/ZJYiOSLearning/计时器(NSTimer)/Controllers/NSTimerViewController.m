//
//  NSTimerViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/22.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController (){
    //要写这个东西才能使系统自动生成的这个属性有效(当set，get方法都存在的时候)
    NSString* _name;
}

@end

@implementation NSTimerViewController {
    NSTimer* timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    
    timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction {
    NSLog(@"ZJY");
    NSLog(@"person:%@",self.person.name);
}

//页面将要进入前台，开启定时器
-(void)viewWillAppear:(BOOL)animated
{
    //开启定时器
    [timer setFireDate:[NSDate distantPast]];
}

//页面消失，进入后台不显示该页面，关闭定时器
-(void)viewDidDisappear:(BOOL)animated
{
    //关闭定时器
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString*)name {
    return _name;
}

@end
@implementation Person

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.name = @"zjy";
    }
    return self;
}

@end
