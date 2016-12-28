//
//  BlockViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/18.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    Block2ViewController *block2VC = segue.destinationViewController;
    
    [block2VC returnText:^(NSString *showText) {
        self.xianshilbl.text = showText;
    }];
}

@end
