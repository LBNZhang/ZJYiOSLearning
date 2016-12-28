//
//  PListTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "PListTableViewController.h"

@interface PListTableViewController ()

@end

@implementation PListTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //创建完整的文件路径
    NSString *filename = [plistPath stringByAppendingPathComponent:@"test.plist"];
    
    NSDictionary* dic = [[NSDictionary alloc]initWithContentsOfFile:filename];
    NSString* nameValue = [dic objectForKey:@"nameKey"];
    NSString* ageValue = [dic objectForKey:@"ageKey"];
    NSString* noValue = [dic objectForKey:@"noKey"];
    
    if (nameValue) {
        self.nameTxf.text = nameValue;
    }
    if (ageValue) {
        self.ageTxf.text = ageValue;
    }
    if (noValue) {
        self.noTxf.text = noValue;
    }
}

- (IBAction)saveAction:(id)sender {
    if (self.nameTxf.hasText && self.ageTxf.hasText && self.noTxf.hasText) {
        //获取应用程序沙盒的Documents目录
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath = [paths objectAtIndex:0];
        //创建完整的文件路径
        NSString *filename = [plistPath stringByAppendingPathComponent:@"test.plist"];
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:self.nameTxf.text,@"nameKey",self.ageTxf.text,@"ageKey",self.noTxf.text,@"noKey", nil];
        [dic writeToFile:filename atomically:YES];
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请将信息填写完整！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
