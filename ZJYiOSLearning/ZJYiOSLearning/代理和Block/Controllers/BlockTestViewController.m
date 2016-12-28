//
//  BlockTestViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "BlockTestViewController.h"

@interface BlockTestViewController ()
@property (nonatomic,assign) NSInteger s;
@end
NSInteger all = 0;
@implementation BlockTestViewController {
    NSInteger m;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (hasAddToCollectionOrNot) {
        [self.shoucangBtn setTitle:@"已收藏" forState:UIControlStateNormal];
    }
    
    __weak typeof(self) weakSelf = self;
    
    self.addBlock = ^(NSInteger a, NSInteger b){
        return [weakSelf add:a andB:b];
    };
    NSLog(@"结果是%ld",(long)self.addBlock(3,4));
    
}


- (NSInteger)add:(NSInteger)a andB:(NSInteger)b {
    return a + b;
}

- (IBAction)shoucangAction:(id)sender {
    if (!hasLoginedOrNot) {
        LoginViewController* loginVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"loginVC"];
        loginVC.addToCollectionBlock = ^(NSInteger a,NSInteger b){
            return a + b;
            //hasAddToCollectionOrNot = YES;
            //[self.shoucangBtn setTitle:@"已收藏" forState:UIControlStateNormal];
        };
        [self.navigationController pushViewController:loginVC animated:YES];
    }else {
        hasAddToCollectionOrNot = YES;
        [self.shoucangBtn setTitle:@"已收藏" forState:UIControlStateNormal];
    }
}
@end
