//
//  Block2ViewController.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/18.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

typedef void (^ReturnTextBlock)(NSString *showText);

@interface Block2ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *shuruTxtField;

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

@end
