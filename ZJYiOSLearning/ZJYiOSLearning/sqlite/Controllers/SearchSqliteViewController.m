//
//  SearchSqliteViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/12/7.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "SearchSqliteViewController.h"

@interface SearchSqliteViewController ()

@end

@implementation SearchSqliteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        //1.准备sqlite语句
        NSString *sqlite = [NSString stringWithFormat:@"select * from student"];
        //2.伴随指针
        sqlite3_stmt *stmt = NULL;
        //3.预执行sqlite语句
        int result = sqlite3_prepare(db, sqlite.UTF8String, -1, &stmt, NULL);//第4个参数是一次性返回所有的参数,就用-1
        if (result == SQLITE_OK) {
            NSLog(@"查询成功");
            //4.执行n次
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                //从伴随指针获取数据,第1列
                self.nameLbl.text = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)] ;
                //从伴随指针获取数据,第2列
                self.ageLbl.text = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)] ;
            }
        } else {
            NSLog(@"查询失败");
        }
        //5.关闭伴随指针
        sqlite3_finalize(stmt);
        
    } else {
        NSLog(@"数据库打开失败");
    }
    
    [self closeSqlite];
}

- (IBAction)deleteAction:(id)sender {
    
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
        
        //1.准备sqlite语句
        NSString *sqlite = [NSString stringWithFormat:@"delete from student where age = '%ld'",(long)5];
        //2.执行sqlite语句
        char *error = NULL;//执行sqlite语句失败的时候,会把失败的原因存储到里面
        int result = sqlite3_exec(db, [sqlite UTF8String], nil, nil, &error);
        if (result == SQLITE_OK) {
            NSLog(@"删除数据成功");
        } else {
            NSLog(@"删除数据失败%s",error);
        }
        
    } else {
        NSLog(@"数据库打开失败");
    }

    [self closeSqlite];
    
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
