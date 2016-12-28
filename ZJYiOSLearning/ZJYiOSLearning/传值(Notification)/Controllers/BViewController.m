//
//  BViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/28.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickedAction:(id)sender {
    if ([self.txtField hasText]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:self.txtField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        NSLog(@"请填写信息");
    }
}

@end
