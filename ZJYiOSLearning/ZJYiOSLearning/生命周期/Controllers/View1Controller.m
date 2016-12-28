//
//  View1Controller.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/14.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller
+ (instancetype)alloc {
    //会自动调用allocwithzone方法，然后在执行return,这两个方法都执行完后self对象才会被创建
    NSLog(@"VC11alloc");
    return [super alloc];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    NSLog(@"VC11allocWithZone");
    return [super allocWithZone:zone];
}
- (instancetype)init {
    NSLog(@"VC11init");
    return [super init];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"VC11initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //由于是从storyboard创建的，所以会直接进入这个方法，如果在这里打印self。view，那么系统会自动调用loadView和viewdidload创建出一个view来。原因是每次访问controller的view且view为空时，loadview方法都会被调用。继续运行下去，那两个方法还会被调用
    NSLog(@"VC11initWithCoder");
    return [super initWithCoder:aDecoder];
}
- (void)loadView {
    //可以自定义初始化view是什么样的,从xib创建的最好不要定义，会覆盖
    NSLog(@"VC11loadView");
    [super loadView];
}
- (void)viewDidLoad {
    NSLog(@"VC11viewDidLoad");
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"VC11viewWillAppear");
    [super viewWillAppear:animated];
}
//按顺序这两个方法是会在这个位置执行的
- (void)viewWillLayoutSubviews {
    NSLog(@"VC11viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
}
- (void)viewDidLayoutSubviews {
    NSLog(@"VC11viewDidLayoutSubviews");
    [super viewDidLayoutSubviews];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"VC11viewDidAppear");
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"VC11viewWillDisappear");
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"VC11viewDidDisappear");
    [super viewDidDisappear:animated];
}
- (void)dealloc {
    NSLog(@"VC11dealloc");
    //[super dealloc];
}
- (void)didReceiveMemoryWarning {
    NSLog(@"VC11didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
}
- (void)loadViewIfNeeded {
    //并不是生命周期的方法，是用来手动调用loadview方法的方法
    NSLog(@"VC11loadViewIfNeeded");
    [super loadViewIfNeeded];
}
- (IBAction)toNextPageAction:(id)sender {
    View2Controller* VC22 = [mainStoryboard instantiateViewControllerWithIdentifier:@"VC22"];
    //[self presentViewController:VC22 animated:YES completion:nil];
    [self.navigationController pushViewController:VC22 animated:YES];
}
@end
