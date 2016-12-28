//
//  TestScrollViewViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/12/2.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "TestScrollViewViewController.h"

@interface TestScrollViewViewController ()

@end

@implementation TestScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIScrollView *mainScrollView = [[UIScrollView alloc]init];
    mainScrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mainScrollView];
    [mainScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"xiaohua"];
    [mainScrollView addSubview:imgView];
    [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imgView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-70.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:imgView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:imgView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:10.0f]];
    [imgView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:160.0f]];
    [imgView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:320.0f]];
    
    UILabel *lbl = [[UILabel alloc]init];
    lbl.text = @"文字文字文字";
    [mainScrollView addSubview:lbl];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lbl attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lbl attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
    
    UITableView *tblView = [[UITableView alloc] init];
    tblView.delegate = self;
    tblView.dataSource = self;
    [mainScrollView addSubview:tblView];
    [tblView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:lbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:tblView attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:lbl attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:tblView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:tblView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [tblView addConstraint:[NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:300.0f]];
    
    UIWebView *webView = [[UIWebView alloc]init];
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    NSURL *url = [[NSURL alloc]initWithString:@"http://www.baidu.com"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [mainScrollView addSubview:webView];
    
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:webView attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:webView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:webView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [webView addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:300.0f]];
    NSLog(@"lllll");
    //取决于它的子空间的
    //[mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:<#(nonnull id)#> attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(nullable id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTableViewCell *mTableViewCell = [[MTableViewCell alloc]init];
    mTableViewCell.textLabel.text = @"1111111111";
    return mTableViewCell;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"lllll");
}
@end
