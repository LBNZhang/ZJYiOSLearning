//
//  LoginViewController.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/27.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@protocol AddToCollectionDelegate <NSObject>

- (void)addToCollection;

@end

@interface LoginViewController : UIViewController
@property (nonatomic,weak) id<AddToCollectionDelegate> delegate;
@property (nonatomic,copy) NSInteger (^addToCollectionBlock)(NSInteger a, NSInteger b);
@end
