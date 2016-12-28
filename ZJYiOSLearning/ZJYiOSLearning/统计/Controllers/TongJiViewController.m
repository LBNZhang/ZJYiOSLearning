//
//  TongJiViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/10.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "TongJiViewController.h"
#import <objc/runtime.h>

@interface TongJiViewController ()

@end

@implementation TongJiViewController

//Runtime替换添加方法
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        //如果是静态方法，就用下面这句
        //Class class = object_getClass((id)self);
        SEL originalSelector = @selector(print);
        SEL swizzledSelector = @selector(print2);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        //如果原方法已经实现过，该bool值返回false，原方法没有实现的话，bool值返回true
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self print];
}

- (IBAction)btnClickedAction:(id)sender {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSInteger tongjiNo = [[ud objectForKey:@"tongjiNo"] integerValue];
    tongjiNo = tongjiNo + 1;
    NSNumber* num = [NSNumber numberWithInteger:tongjiNo];
    [ud setObject:num forKey:@"tongjiNo"];
    //马上同步
    [ud synchronize];
}

- (void)print {
    NSLog(@"打印print");
}

- (void)print2 {
    [self print2];
    NSLog(@"打印22322");
}
@end
