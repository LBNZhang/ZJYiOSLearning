//
//  LoginViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)loginAction:(id)sender {
    hasLoginedOrNot = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(addToCollection)]) {
        [self.delegate addToCollection];
    }
    
    if (self.addToCollectionBlock ) {
        NSInteger result = self.addToCollectionBlock(3,5);
        NSLog(@"%ld",(long)result);
    }

    [self.navigationController popViewControllerAnimated:YES];

}
@end
