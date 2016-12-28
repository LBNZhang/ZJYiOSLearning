//
//  DelegateTestViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "DelegateTestViewController.h"

@interface DelegateTestViewController ()

@end

@implementation DelegateTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (hasAddToCollectionOrNot) {
        [self.shoucangBtn setTitle:@"已收藏" forState:UIControlStateNormal];
    };
}

- (IBAction)shoucangAction:(id)sender {
    if (!hasLoginedOrNot) {
        LoginViewController* loginVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"loginVC"];
        loginVC.delegate = self;
        [self.navigationController pushViewController:loginVC animated:YES];
    }
}

- (void)addToCollection {
    hasAddToCollectionOrNot = YES;
    [self.shoucangBtn setTitle:@"已收藏" forState:UIControlStateNormal];
}

@end
