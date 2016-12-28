//
//  FenXiangViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/11.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "FenXiangViewController.h"

#define PLUS(a,b) a+b
#define THEME_COLOR [UIColor redColor]

@interface FenXiangViewController ()
@end

@implementation FenXiangViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSInteger s = [self plusWithA:4 AndB:5];
    
    s = PLUS(4, 5);
    
    UIColor *color = [UIColor redColor];
    //系统自定义的宏，判断是不是Debug或者release
    if (DEBUG) {
    } else {
    }
}
- (NSInteger) plusWithA:(NSInteger)a AndB:(NSInteger)b {
    return a + b;
}
@end
