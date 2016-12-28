//
//  ViewController1.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.student = [Student new];
    self.student.name = @"zhangzhangzhang";
    
    Student* student2 = [Student new];
    student2 = [self.student copy];
    student2.name = @"z2z2z2z2z2z2";
    
    NSLog(@"student2的name是%@",student2.name);
    NSLog(@"student2是%@",student2);
}

- (IBAction)tiaozhuanAction:(id)sender {
    ViewController2* VC2 = [mainStoryboard instantiateViewControllerWithIdentifier:@"VC2"];
    VC2.student = self.student;
    [self.navigationController pushViewController:VC2 animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"VC1的name是%@",self.student.name);
    NSLog(@"VC1的student是%@",self.student);
}

@end
