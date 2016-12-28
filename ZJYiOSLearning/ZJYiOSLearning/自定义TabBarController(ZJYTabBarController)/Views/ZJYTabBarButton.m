//
//  ZJYTabBarButton.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/20.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ZJYTabBarButton.h"

@implementation ZJYTabBarButton

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
    self.imgView = [[UIImageView alloc]init];
    self.imgView.image = [UIImage imageNamed:@"xiaohua"];
    [self addSubview:self.imgView];
    
    self.lbl = [[UILabel alloc]init];
    self.lbl.text = @"btn";
    self.lbl.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:self.lbl];
    
    [self.imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.imgView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.imgView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:10.0f]];
    [self.imgView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:20.0f]];
    [self.imgView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:20.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.lbl attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.lbl attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-10.0f]];
}

@end
