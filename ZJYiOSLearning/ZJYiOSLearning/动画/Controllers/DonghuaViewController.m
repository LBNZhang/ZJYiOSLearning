//
//  DonghuaViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/17.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "DonghuaViewController.h"
//typedef相当于宏，就是定义一个什么是什么
typedef NSInteger(^MyBlock)(NSInteger,NSInteger);

@interface DonghuaViewController ()
@property (nonatomic, copy) NSInteger (^bBlock) (NSInteger,NSInteger);
@property (nonatomic, copy) NSString *testStr;


@end

@implementation DonghuaViewController {
    UIButton* btn;
    UIView* view;
    CALayer* layer ;
   // UIView* containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    self.view.backgroundColor = [UIColor blueColor];
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(50, 200, 60, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer insertSublayer:layer atIndex:0];
    
    //UIKit建立在Core Animation（默认对所有东西都做动画）之上，然而隐式动画被UIKit禁用掉了,UIView关联的图层禁用了隐式动画。。。说不清楚，看清单7.6上面那一段话http://www.cnblogs.com/tmacforever/p/4316754.html
    //隐式动画是指没有指定任何动画类型，仅仅改变一个属性，然后core animation决定如何以及何时去做动画。
    
    btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 60, 120)];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
     */
    NSInteger s = 5;
    NSString* ss = @"ss";
    
    UILabel* lbl = [UILabel new];
    
    NSInteger count = CFGetRetainCount((__bridge CFTypeRef)(lbl));
    
    
    MyBlock mBlock = ^(NSInteger a,NSInteger b) {
        return a+b;
    };
    
    MyBlock nBlock = ^(NSInteger a, NSInteger b) {
        return a-b;
    };
    
    
    NSInteger (^aBlock) (NSInteger a, NSInteger b) = ^(NSInteger a,NSInteger b) {
        //如果只是在
//        lbl = [UILabel new];
//        ss = @"dd";
//        s = a+b;
        return a+ b +s;
    };
    
    self.bBlock = ^(NSInteger a, NSInteger b) {
        return a+b;
    };
    self.bBlock(s,s);
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor greenColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"xiaohua.png"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    //create the keyframe animation
    //create the keyframe animation
    
    //shipLayer.position = CGPointMake(300, 150);

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    [shipLayer addAnimation:animation forKey:nil];
     
}

- (void)btnClicked {
    /*
    [CATransaction begin];
    [CATransaction setAnimationDuration:5.0];
    //完成块里的东西会在外面的动画执行完了以后再执行
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = layer.affineTransform;
        [CATransaction setAnimationDuration:5.0];
        transform = CGAffineTransformRotate(transform, M_PI_2);
        layer.affineTransform = transform;
    }];
    //隐式
    [layer setBackgroundColor:[UIColor greenColor].CGColor];
    [CATransaction commit];
    */
    /*
    CABasicAnimation* animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
    [layer addAnimation:animation forKey:nil];*/
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"xiaohua.png"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    //create the keyframe animation
    //create the keyframe animation
    
    [CATransaction setAnimationDuration:4];
    
    shipLayer.position = CGPointMake(300, 150);
    
}
@end
