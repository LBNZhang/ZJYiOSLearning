//
//  NSFileManagerTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "NSFileManagerTableViewController.h"

@interface NSFileManagerTableViewController ()

@end

@implementation NSFileManagerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readFile];
}

//获取Documents目录
-(NSString *)dirDoc{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"获取到的documents目录是: %@",documentsDirectory);
    return documentsDirectory;
}

//读文件
-(void)readFile{
    NSString *documentsPath =[self dirDoc];
    NSString *testPath = [documentsPath stringByAppendingPathComponent:@"test.txt"];
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    //NSString *content=[NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:testPath];
    NSString* nameStr = [dic objectForKey:@"nameKey"];
    NSString* ageStr = [dic objectForKey:@"ageKey"];
    NSString* noStr = [dic objectForKey:@"noKey"];
    NSLog(@"文件读取成功: %@,%@,%@",nameStr,ageStr,noStr);
    if (nameStr) {
        self.nameTxf.text = nameStr;
    }
    if (ageStr) {
        self.ageTxf.text = ageStr;
    }
    if (noStr) {
        self.noTxf.text = noStr;
    }
}

- (IBAction)saveAction:(id)sender {
    if (self.nameTxf.hasText && self.ageTxf.hasText && self.noTxf.hasText) {
        NSString* documentsPath =[self dirDoc];
        NSString* testPath = [documentsPath stringByAppendingPathComponent:@"test.txt"];
        NSString* nameStr = self.nameTxf.text;
        NSString* ageStr = self.ageTxf.text;
        NSString* noStr = self.noTxf.text;
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:nameStr,@"nameKey",ageStr,@"ageKey",noStr,@"noKey", nil];
        BOOL res=[dic writeToFile:testPath atomically:YES];
        if (res) {
            NSLog(@"文件写入成功");
        }else
            NSLog(@"文件写入失败");
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请将信息填写完整！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
