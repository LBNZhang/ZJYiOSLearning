
//
//  Block2ViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/18.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "Block2ViewController.h"

@interface Block2ViewController ()

@end

@implementation Block2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.shuruTxtField.text);
    }
}

@end
