//
//  HongBaoView.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/7.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "HongBaoView.h"

@implementation HongBaoView {
    UIImageView* imgView;
    UIImageView* imgView2;
    CABasicAnimation *animation;
    NSInteger count;
}

//必须有
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
//没有storyboard或者xib就不用
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    count = 0;
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
    UIView* view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    [self addSubview:view1];
    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:400.0f]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:250.0f]];
    
    UIView* view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:250.0f]];
    
    UIView* view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor clearColor];
    [self addSubview:view3];
    [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view3 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view3 attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:400.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:250.0f]];
    
    imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"xiaohua"];
    [view3 addSubview:imgView];
    [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imgView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imgView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-40.0f]];
    [imgView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:40.0f]];
    [imgView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:40.0f]];
    
    UILabel* lbl = [[UILabel alloc]init];
    lbl.text = @"zwl";
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:10.0f];
    [view3 addSubview:lbl];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:lbl attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lbl attribute:NSLayoutAttributeTop multiplier:1.0f constant:-10.0f]];
    
    UILabel* lbl2 = [[UILabel alloc]init];
    lbl2.text = @"给你发了一个红包";
    lbl2.textColor = [UIColor whiteColor];
    lbl2.font = [UIFont systemFontOfSize:12.0f];
    [view3 addSubview:lbl2];
    [lbl2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:lbl2 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:lbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lbl2 attribute:NSLayoutAttributeTop multiplier:1.0f constant:-10.0f]];
    
    UILabel* lbl3 = [[UILabel alloc]init];
    lbl3.text = @"恭喜发财，大吉大利!";
    lbl3.textColor = [UIColor whiteColor];
    lbl3.font = [UIFont systemFontOfSize:18.0f];
    [view3 addSubview:lbl3];
    [lbl3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:lbl3 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:lbl2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lbl3 attribute:NSLayoutAttributeTop multiplier:1.0f constant:-30.0f]];
    
    imgView2 = [[UIImageView alloc]init];
    imgView2.image = [UIImage imageNamed:@"xiaohua"];
    imgView2.userInteractionEnabled = YES;
    [view3 addSubview:imgView2];
    [imgView2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imgView2 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:lbl3 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:imgView2 attribute:NSLayoutAttributeTop multiplier:1.0f constant:-70.0f]];
    [imgView2 addConstraint:[NSLayoutConstraint constraintWithItem:imgView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:80.0f]];
    [imgView2 addConstraint:[NSLayoutConstraint constraintWithItem:imgView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:80.0f]];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgView2Tapped)];
    [imgView2 addGestureRecognizer:tap];
    
    UIButton* btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"xiaohua"] forState:UIControlStateNormal];
    [view3 addSubview:btn];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:self action:@selector(btnTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeLeading multiplier:1.0f constant:-15.0f]];
    [view3 addConstraint:[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15.0f]];
    [btn addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:20.0f]];
    [btn addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:20.0f]];
    
    [self layoutIfNeeded];
    
    CGPoint point1 = CGPointMake(view2.frame.origin.x, view2.frame.origin.y);
    CGPoint point2 = CGPointMake(view2.frame.origin.x, view2.frame.origin.y + view2.frame.size.height);
    CGPoint point3 = CGPointMake(view2.frame.origin.x + view2.frame.size.width, view2.frame.origin.y + view2.frame.size.height);
    CGPoint point4 = CGPointMake(view2.frame.origin.x + view2.frame.size.width, view2.frame.origin.y);
    CGPoint controlPoint = CGPointMake(view2.frame.origin.x + view2.frame.size.width * 0.5, view2.frame.origin.y + view2.frame.size.height + 80);
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    [aPath moveToPoint:point1];
    [aPath addLineToPoint:point2];
    [aPath addQuadCurveToPoint:point3 controlPoint:controlPoint];
    [aPath addLineToPoint:point4];
    [aPath addLineToPoint:point1];
    
    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    maskLayer.path = aPath.CGPath;
    maskLayer.fillColor = [UIColor purpleColor].CGColor;
    maskLayer.frame = aPath.bounds;
    maskLayer.shadowPath = aPath.CGPath;
    maskLayer.shadowRadius = 2.0f;
    maskLayer.shadowOffset = CGSizeMake(0, 2);
    maskLayer.shadowColor = [UIColor yellowColor].CGColor;
    maskLayer.shadowOpacity = 1.0f;
    [view2.layer insertSublayer:maskLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imgView.layer.cornerRadius = 20.0f;
    imgView.layer.masksToBounds = YES;
    imgView2.layer.cornerRadius = 40.0f;
    imgView2.layer.masksToBounds = YES;
}

- (void)imgView2Tapped {
    NSLog(@"圆圈被点击了！");
    animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 3;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeRemoved;
    animation.repeatCount = 50;
    [imgView2.layer addAnimation:animation forKey:nil];
    
    if (count > 0) {
        if (imgView2.layer.speed == 0) {
            imgView2.layer.speed = 1;
        }else {
            imgView2.layer.speed = 0;
            [imgView2.layer removeAllAnimations];
        }
    }
    count++;
}

- (void)btnTapped {
    NSLog(@"btn点击了");
    [self removeFromSuperview];
}

@end
