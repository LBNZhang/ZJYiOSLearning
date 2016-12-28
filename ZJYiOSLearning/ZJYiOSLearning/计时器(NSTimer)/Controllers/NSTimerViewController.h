//
//  NSTimerViewController.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/22.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
@class Person;
@interface NSTimerViewController : UIViewController
@property (nonatomic,copy) NSString* name;
@property Person* person;
@end


@interface Person : NSObject
@property NSString* name;

@end


