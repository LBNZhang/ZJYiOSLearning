//
//  ZJYTabBarViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/20.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ZJYTabBarViewController.h"

@interface ZJYTabBarViewController ()

@end

@implementation ZJYTabBarViewController {
    ZJYTabBarView* zjyTabBarView;
    UIView* mainView;
    Tab1ViewController* tab1VC;
    Tab2ViewController* tab2VC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainView = [[UIView alloc]init];
    tab1VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tab1VC"];
    tab2VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tab2VC"];
    //说是必须加，不然生命周期会出问题
    [self addChildViewController:tab1VC];
    [self addChildViewController:tab2VC];
    mainView = tab1VC.view;
    mainView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:mainView];
    [self setConstraintForView:mainView];
    
    zjyTabBarView = [[ZJYTabBarView alloc]init];
    [self.view addSubview:zjyTabBarView];
    [zjyTabBarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftBtnTapped)];
    [zjyTabBarView.leftBtn addGestureRecognizer:tap1];
    
    UITapGestureRecognizer* tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightBtnTapped)];
    [zjyTabBarView.rightBtn addGestureRecognizer:tap2];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:zjyTabBarView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:zjyTabBarView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:zjyTabBarView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    [zjyTabBarView addConstraint:[NSLayoutConstraint constraintWithItem:zjyTabBarView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:44.0f]];
}

- (void)leftBtnTapped {
    [mainView removeFromSuperview];
    mainView = tab1VC.view;
    
    [self.view addSubview:mainView];
    [self setConstraintForView:mainView];
    
    zjyTabBarView.leftBtn.backgroundColor = [UIColor yellowColor];
    zjyTabBarView.rightBtn.backgroundColor = [UIColor grayColor];
}

- (void)rightBtnTapped {
    [mainView removeFromSuperview];
    mainView = tab2VC.view ;
    [self.view addSubview:mainView];
    [self setConstraintForView:mainView];
    
    zjyTabBarView.rightBtn.backgroundColor = [UIColor purpleColor];
    zjyTabBarView.leftBtn.backgroundColor = [UIColor grayColor];
}

- (void)setConstraintForView:(UIView*)view {
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200.0f]];
}

@end
