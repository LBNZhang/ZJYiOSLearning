//
//  BlockTestViewController.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "LoginViewController.h"

@interface BlockTestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *shoucangBtn;
@property (nonatomic,copy) NSInteger(^ addBlock)(NSInteger a, NSInteger b);
@end
