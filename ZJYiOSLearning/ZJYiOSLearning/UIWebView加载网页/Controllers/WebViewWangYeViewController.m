//
//  WebViewWangYeViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/29.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "WebViewWangYeViewController.h"

#define MAXX(a,b) [self maxxBetweenA:a AndB:b]

@interface WebViewWangYeViewController ()<UIWebViewDelegate>

@end

@implementation WebViewWangYeViewController {
    UIWebView* webView;
}

- (NSInteger)maxxBetweenA:(NSInteger)a AndB:(NSInteger)b {
    if (a > b) {
        return a;
    }else {
        return b;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger s = MAXX(3, 5);
    NSLog(@"%ld",(long)s);
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    [self.view addSubview:webView];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://www.baidu.com"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //比较两个时间字符串的大小
    NSString* aString = @"2116-12-23 12:23:23";
    NSString* bString = @"2017-12-23 12:23:23";
    NSString* resultString = [self timeStringCompareWithA:aString AndB:bString];
    NSLog(@"%@",resultString);
    
    //这个实现定时器的代码有什么问题：
    NSTimer *mT = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(done) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:mT forMode:NSRunLoopCommonModes];
    [mT fire];
    //手动调用layoutsubviews方法
    [self.view layoutIfNeeded];
}

//几个代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)web {
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error {
    NSLog(@"DidFailLoadWithError");
}

- (NSString*)timeStringCompareWithA:(NSString*)a AndB:(NSString*)b {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yy-MM-dd hh:mm:ss"];
    NSDate* dateA = [dateFormatter dateFromString:a];
    NSDate* dateB = [dateFormatter dateFromString:b];
    if ([dateA compare:dateB] == NSOrderedDescending) {
        return a;
    }else {
        return b;
    }
}

- (void)done {
    NSLog(@"done");
}

//当一个视图控制器被创建，并在屏幕上显示的时候。 代码的执行顺序
+ (instancetype)alloc{
    //创建对象，分配空间
    return [super alloc];
}

- (nullable instancetype)init{
    //初始化对象，初始化数据
    self = [super init];
    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    //加载xib的方法
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    //加载storyboard方法
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)loadView{
    [super loadView];
    //从nib载入视图在viewdidload之前执行
}

//viewDidLoad{}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //视图将出现在屏幕之前，马上这个视图就会被展现在屏幕上了;当APP有多个视图时，在视图间切换时，并不会再次载入viewDidLoad方法，所以如果在调入视图时，需要对数据做更新，就只能在这个方法内实现了
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //视图已在屏幕上渲染完成;有时候，由于一些特殊的原因，我们不能在viewWillApper方法里，对视图进行更新。那么可以重写这个方法，在这里对正在显示的视图进行进一步的设置
}

//当一个视图被移除屏幕并且销毁的时候的执行顺序
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     //视图将被从屏幕上移除之前执行;在视图变换时，当前视图在即将被移除、或者被覆盖时，会调用这个方法进行一些善后的处理和设置
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // 视图已经被从屏幕上移除，用户看不到这个视图了;我们可以重写这个方法，对已经消失，或者被覆盖，或者已经隐藏了的视图做一些其他操作
}

- (void)dealloc{
    //视图被销毁，此处需要对你在init和viewDidLoad中创建的对象进行释放,不需要super
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    //内存警告
}

- (void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    //手动调用这个方法酒会调用loadview方法
}

- (void)viewWillLayoutSubviews{}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //autolayout设置的约束和本身的frame不匹配的时候调用，修改frame的时候调用，往里面添加子控件，修改子空间的时候调用;addSubview会触发layoutSubviews
}




@end
