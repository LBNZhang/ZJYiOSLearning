//
//  View2Controller.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/14.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()

@end

@implementation View2Controller
+ (instancetype)alloc {
    NSLog(@"VC22alloc");
    return [super alloc];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    NSLog(@"VC22allocWithZone");
    return [super allocWithZone:zone];
}
- (instancetype)init {
    NSLog(@"VC22init");
    return [super init];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"VC22initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"VC22initWithCoder");
    return [super initWithCoder:aDecoder];
    //push的情况下这个方法执行后上一个页面的viewwillDisappear执行
}
- (void)loadView {
    NSLog(@"VC22loadView");
    [super loadView];
}
- (void)viewDidLoad {
    NSLog(@"VC22viewDidLoad");
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
    //上一个页面返回回来时在上一个页面viewWillDisappear后马上执行这里
    NSLog(@"VC22viewWillAppear");
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"VC22viewDidAppear");
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"VC22viewWillDisappear");
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"VC22viewDidDisappear");
    [super viewDidDisappear:animated];
}
- (void)dealloc {
    NSLog(@"VC22dealloc");
    //[super dealloc];
}
- (void)didReceiveMemoryWarning {
    NSLog(@"VC22didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
}
- (void)viewWillLayoutSubviews {
    NSLog(@"VC22viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
}
- (void)viewDidLayoutSubviews {
    NSLog(@"VC22viewDidLayoutSubviews");
    [super viewDidLayoutSubviews];
    //push的情况下这个方法执行后上一个页面的viewDidDisappear执行
}
- (void)loadViewIfNeeded {
    NSLog(@"VC22loadViewIfNeeded");
    [super loadViewIfNeeded];
}
- (IBAction)toNextPageAction:(id)sender {
    View3Controller* VC33 = [mainStoryboard instantiateViewControllerWithIdentifier:@"VC33"];
    //[self presentViewController:VC33 animated:YES completion:nil];
    [self.navigationController pushViewController:VC33 animated:YES];
}
@end
