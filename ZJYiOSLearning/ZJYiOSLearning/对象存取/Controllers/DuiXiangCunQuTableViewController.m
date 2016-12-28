//
//  DuiXiangCunQuTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "DuiXiangCunQuTableViewController.h"

@interface DuiXiangCunQuTableViewController ()

@end

@implementation DuiXiangCunQuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveAction:(id)sender {
    if (self.nameTxf.hasText && self.ageTxf.hasText && self.noTxf.hasText) {
        
        NSString* nameStr = self.nameTxf.text;
        NSString* ageStr = self.ageTxf.text;
        NSString* noStr = self.noTxf.text;
        
        XuLieHua* xuliehua = [XuLieHua new];
        xuliehua.name = nameStr;
        xuliehua.no = ageStr.integerValue;
        xuliehua.sex = noStr;
        
        NSData* xuliehuaData = [NSKeyedArchiver archivedDataWithRootObject:xuliehua];
        
        NSLog(@"...");
        /*
         NSString *rootDir = NSHomeDirectory();
         NSString *path = [rootDir stringByAppendingPathComponent:@"test.txt"];
         
         NSMutableData *data = [NSMutableData data];
         NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
         
        NSArray *array = @[@"one",@"two"];
        [archiver encodeInt:100 forKey:@"age"];//相当于SharedPreference的putInteger(key,value);
        [archiver encodeObject:array forKey:@"names"];//
        [archiver finishEncoding];//此方法调用，则将数据存入data
        
        if([data writeToFile:path atomically:YES]){  
            NSLog(@"对象存入文件成功");
        }
*/
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请将信息填写完整！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
