//
//  Global.m
//  3DTouchTest1010
//
//  Created by 张靖尧 on 16/10/10.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "Global.h"

@implementation Global

NSInteger startAppType;
UIStoryboard* mainStoryboard;
Boolean hasAddToCollectionOrNot;
Boolean hasLoginedOrNot;
sqlite3 *db;

//初始化全局变量
+ (void) setupGlobalVariable{
    
    mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
}

//获取工程中当前所显示页面的navigationcontroller页面
//前提是工程里的present关系必须是有navigationcontroller 来承接
+ (UINavigationController*) getLastNavigationController {
    UINavigationController* naviC = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    while (naviC.presentedViewController) {
        naviC = (UINavigationController*)naviC.presentedViewController;
    }
    return naviC;
}

//获取当前页面
+ (UIViewController*) getCurrentViewController {
    UIViewController* vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    vc = vc.childViewControllers[vc.childViewControllers.count - 1];
    return vc;
}

@end
