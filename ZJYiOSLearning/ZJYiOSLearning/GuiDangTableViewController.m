//
//  GuiDangTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "GuiDangTableViewController.h"

@interface GuiDangTableViewController ()

@end

@implementation GuiDangTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //反归档，从文件中取出数据
    NSMutableData *data1 = [NSMutableData dataWithContentsOfFile:[self filePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data1];
    NSString* nameValue  = [unarchiver decodeObjectForKey:@"nameKey"];
    NSString* ageValue =  [unarchiver decodeObjectForKey:@"ageKey"];
    NSString* noValue =  [unarchiver decodeObjectForKey:@"noKey"];
    
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

-(NSString *)filePath {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDirectory, YES)objectAtIndex:0];
    NSString *path = [docPath stringByAppendingPathComponent:@"texts"];
    
    return path;
}

- (IBAction)saveAction:(id)sender {
    if (self.nameTxf.hasText && self.ageTxf.hasText && self.noTxf.hasText) {
       
        NSString* nameStr = self.nameTxf.text;
        NSString* ageStr = self.ageTxf.text;
        NSString* noStr = self.noTxf.text;
        
        //文件的归档
        NSMutableData *data = [NSMutableData data ];
        //创建一个归档类
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
        
        [archiver encodeObject:nameStr forKey:@"nameKey"];
        [archiver encodeObject:ageStr forKey:@"ageKey"];
        [archiver encodeObject:noStr forKey:@"noKey"];
        [archiver finishEncoding];
        //将数据写入文件里
        [data writeToFile:[self filePath] atomically:YES];
        
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请将信息填写完整！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
