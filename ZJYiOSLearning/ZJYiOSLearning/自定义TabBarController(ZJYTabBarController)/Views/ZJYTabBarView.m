//
//  ZJYTabBarView.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/20.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ZJYTabBarView.h"

@implementation ZJYTabBarView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}


- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void) setupViews {
    self.leftBtn = [[ZJYTabBarButton alloc]init];
    self.leftBtn.imgView.image = [UIImage imageNamed:@"kongque"];
    self.leftBtn.lbl.text = @"leftBtn";
    //[leftBtn setImage:[UIImage imageNamed:@"xiaohua"] forState:UIControlStateNormal];
    //[leftBtn setTitle:@"leftBtn" forState:UIControlStateNormal];
    [self.leftBtn setBackgroundColor:[UIColor grayColor]];
    [self addSubview:self.leftBtn];
    
    self.rightBtn = [[ZJYTabBarButton alloc]init];
    //[rightBtn setImage:[UIImage imageNamed:@"kongque"] forState:UIControlStateNormal];
   // [rightBtn setTitle:@"rightBtn" forState:UIControlStateNormal];
    [self.rightBtn setBackgroundColor:[UIColor grayColor]];
    [self addSubview:self.rightBtn];
    
    [self.leftBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.rightBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:NSLayoutAttributeWidth multiplier:2.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rightBtn attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.rightBtn attribute:NSLayoutAttributeWidth multiplier:2.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rightBtn attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rightBtn attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
}

@end
