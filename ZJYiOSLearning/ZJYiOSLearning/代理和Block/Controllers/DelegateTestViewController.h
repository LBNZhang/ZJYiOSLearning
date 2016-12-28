//
//  DelegateTestViewController.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "LoginViewController.h"


@interface DelegateTestViewController : UIViewController<AddToCollectionDelegate>

@property (weak, nonatomic) IBOutlet UIButton *shoucangBtn;

@end
