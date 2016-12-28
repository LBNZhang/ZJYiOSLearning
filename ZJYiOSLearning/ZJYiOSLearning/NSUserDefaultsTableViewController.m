//
//  NSUserDefaultsTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "NSUserDefaultsTableViewController.h"

@interface NSUserDefaultsTableViewController ()

@end

@implementation NSUserDefaultsTableViewController {
    NSUserDefaults* ud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ud = [NSUserDefaults standardUserDefaults];
    NSString* nameValue = [ud objectForKey:@"nameKey"];
    NSString* ageValue = [ud objectForKey:@"ageKey"];
    NSString* noValue = [ud objectForKey:@"noKey"];
    
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
        
        NSString* nameStr = self.nameTxf.text;
        NSString* ageStr = self.ageTxf.text;
        NSString* noStr = self.noTxf.text;
        
        [ud setObject:nameStr forKey:@"nameKey"];
        [ud setObject:ageStr forKey:@"ageKey"];
        [ud setObject:noStr forKey:@"noKey"];
        //同步，确定写入完成
        [ud synchronize];
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请将信息填写完整！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
