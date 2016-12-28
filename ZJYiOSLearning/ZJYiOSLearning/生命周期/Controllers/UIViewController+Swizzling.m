//
//  UIViewController+Swizzling.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/16.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self changeOriginalSelector:@selector(alloc) WithSwizzledSelector:@selector(mAlloc) UsingIsClassMethodOrNot:YES];
        [self changeOriginalSelector:@selector(allocWithZone:) WithSwizzledSelector:@selector(mAllocWithZone:) UsingIsClassMethodOrNot:YES];
        [self changeOriginalSelector:@selector(init) WithSwizzledSelector:@selector(mInit) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(initWithNibName:bundle:) WithSwizzledSelector:@selector(mInitWithNibName:bundle:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(initWithCoder:) WithSwizzledSelector:@selector(mInitWithCoder:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(loadView) WithSwizzledSelector:@selector(mLoadView) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewDidLoad) WithSwizzledSelector:@selector(mViewDidLoad) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewWillAppear:) WithSwizzledSelector:@selector(mViewWillAppear:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewWillLayoutSubviews) WithSwizzledSelector:@selector(mViewWillLayoutSubviews) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewDidLayoutSubviews) WithSwizzledSelector:@selector(mViewDidLayoutSubviews) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewDidAppear:) WithSwizzledSelector:@selector(mViewDidAppear:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewWillDisappear:) WithSwizzledSelector:@selector(mViewWillDisappear:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(viewDidDisappear:) WithSwizzledSelector:@selector(mViewDidDisappear:) UsingIsClassMethodOrNot:NO];
        [self changeOriginalSelector:@selector(didReceiveMemoryWarning) WithSwizzledSelector:@selector(mDidReceiveMemoryWarning) UsingIsClassMethodOrNot:NO];
    });
}


+ (void)changeOriginalSelector:(SEL)originalSelector WithSwizzledSelector:(SEL)swizzledSelector UsingIsClassMethodOrNot:(Boolean)isClassMethodOrNot {
    Class class;
    if (isClassMethodOrNot) {
        //如果是静态方法，就用下面这句
        class = object_getClass((id)self);
    } else {
        class = [self class];
    }
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector,method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (instancetype)mAlloc {
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return [self mAlloc];
}
+ (instancetype)mAllocWithZone:(struct _NSZone *)zone {
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return [self mAllocWithZone:zone];
}
- (instancetype)mInit {
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return [self mInit];
}
- (instancetype)mInitWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return [self mInitWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
- (instancetype)mInitWithCoder:(NSCoder *)aDecoder {
    NSLog(@"%@调用了%s方法",[self class],__func__);
    return [self mInitWithCoder:aDecoder];
}
- (void)mLoadView {
    [self mLoadView];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewDidLoad {
    [self mViewDidLoad];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewWillAppear:(BOOL)animated {
    [self mViewWillAppear:animated];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewWillLayoutSubviews {
    [self mViewWillLayoutSubviews];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewDidLayoutSubviews {
    [self mViewDidLayoutSubviews];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewDidAppear:(BOOL)animated {
    [self mViewDidAppear:animated];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewWillDisappear:(BOOL)animated {
    [self mViewWillDisappear:animated];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mViewDidDisappear:(BOOL)animated {
    [self mViewDidDisappear:animated];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
- (void)mDidReceiveMemoryWarning {
    [self mDidReceiveMemoryWarning];
    NSLog(@"%@调用了%s方法",[self class],__func__);
}
@end
