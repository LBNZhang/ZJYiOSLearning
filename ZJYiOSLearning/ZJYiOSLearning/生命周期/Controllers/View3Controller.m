//
//  View3Controller.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/14.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "View3Controller.h"

@interface View3Controller ()

@end

@implementation View3Controller
+ (instancetype)alloc {
    NSLog(@"VC33alloc");
    return [super alloc];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    NSLog(@"VC33allocWithZone");
    return [super allocWithZone:zone];
}
- (instancetype)init {
    NSLog(@"VC33init");
    return [super init];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"VC33initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"VC233initWithCoder");
    return [super initWithCoder:aDecoder];
}
- (void)loadView {
    NSLog(@"VC33loadView");
    [super loadView];
}
- (void)viewDidLoad {
    NSLog(@"VC33viewDidLoad");
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"VC33viewWillAppear");
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"VC33viewDidAppear");
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    //push时从这里返回上一个页面时马上会执行这个方法
    NSLog(@"VC33viewWillDisappear");
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    //push从这里返回上一个页面时，上一个页面viewWillAppear后这边执行
    NSLog(@"VC33viewDidDisappear");
    [super viewDidDisappear:animated];
}
- (void)dealloc {
    NSLog(@"VC33dealloc");
    //push从这里返回上一个页面时，上一个页面viewDidAppear后执行这里
    //[super dealloc];
}
- (void)didReceiveMemoryWarning {
    NSLog(@"VC33didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
}
- (void)viewWillLayoutSubviews {
    NSLog(@"VC33viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
}
- (void)viewDidLayoutSubviews {
    NSLog(@"VC33viewDidLayoutSubviews");
    [super viewDidLayoutSubviews];
}
- (void)loadViewIfNeeded {
    NSLog(@"VC33loadViewIfNeeded");
    [super loadViewIfNeeded];
}
- (IBAction)backToLastPage:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
