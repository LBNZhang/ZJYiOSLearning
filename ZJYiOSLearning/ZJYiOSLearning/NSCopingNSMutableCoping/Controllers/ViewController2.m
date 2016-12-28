//
//  ViewController2.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.student.name = @"miaomiaomiaomiao";
    NSLog(@"VC2的name是%@",self.student.name);
    NSLog(@"VC2的student的地址是%@",self.student);
}

@end
