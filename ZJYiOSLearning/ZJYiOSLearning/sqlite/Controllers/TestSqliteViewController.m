//
//  TestSqliteViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/12/6.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "TestSqliteViewController.h"

@interface TestSqliteViewController ()

@end

@implementation TestSqliteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addAction:(id)sender {
    if (db != nil) {
        NSLog(@"数据库已打开");
    }
    //获取文件路径
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *strPath = [str stringByAppendingPathComponent:@"my.sqlite"];
    NSLog(@"%@",strPath);
    //打开数据库
    //如果数据库存在就打开,如果不存在就创建一个再打开
    int result = sqlite3_open([strPath UTF8String], &db);
    //判断
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
        [self createTable];
    } else {
        NSLog(@"数据库打开失败");
    }
}

- (IBAction)changeAction:(id)sender {
    if (db != nil) {
        NSLog(@"数据库已打开");
    }
    //获取文件路径
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *strPath = [str stringByAppendingPathComponent:@"my.sqlite"];
    NSLog(@"%@",strPath);
    //打开数据库
    //如果数据库存在就打开,如果不存在就创建一个再打开
    int result = sqlite3_open([strPath UTF8String], &db);
    //判断
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
        //1.sqlite语句
        NSString *sqlite = [NSString stringWithFormat:@"update student set name='%@',age='%ld' where age='%ld'",self.nameTxtField.text,[self.ageTxtField.text integerValue],(long)5];
        //2.执行sqlite语句
        char *error = NULL;//执行sqlite语句失败的时候,会把失败的原因存储到里面
        int result1 = sqlite3_exec(db, [sqlite UTF8String], nil, nil, &error);
        if (result1 == SQLITE_OK) {
            NSLog(@"修改数据成功");
        } else {
            NSLog(@"修改数据失败");
        }
        [self closeSqlite];
    } else {
        NSLog(@"数据库打开失败");
    }
}

- (void)createTable {
    //1.准备sqlite语句
    NSString *sqlite = [NSString stringWithFormat:@"create table if not exists 'student' ('number' integer primary key autoincrement not null,'name' text,'age' integer)"];
    //2.执行sqlite语句
    char *error = NULL;//执行sqlite语句失败的时候,会把失败的原因存储到里面
    int result = sqlite3_exec(db, [sqlite UTF8String], nil, nil, &error);
    //3.sqlite语句是否执行成功
    
    if (result == SQLITE_OK) {
        NSLog(@"创建表成功");
        [self add];
    } else {
        NSLog(@"创建表失败");
    }
}

- (void)add {
    @synchronized (self) {
        //1.准备sqlite语句
        NSString *sqlite = [NSString stringWithFormat:@"insert into student(name,age) values ('%@','%ld')",self.nameTxtField.text,(long)[self.ageTxtField.text integerValue]];
        //2.执行sqlite语句
        char *error = NULL;//执行sqlite语句失败的时候,会把失败的原因存储到里面
        int result = sqlite3_exec(db, [sqlite UTF8String], nil, nil, &error);
        if (result == SQLITE_OK) {
            NSLog(@"添加数据成功");
        } else {
            NSLog(@"添加数据失败");
        }
        [self closeSqlite];
    }
}

- (void)closeSqlite {
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库关闭成功");
    } else {
        NSLog(@"数据库关闭失败");
    }
}
@end
