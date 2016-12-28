//
//  StudentModel.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/9.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "StudentModel.h"
@implementation StudentModel
//iOS单例模式
+ (StudentModel *)sharedStudentModel {
    //这句话只会初始化一次
    static StudentModel* studentModelInstance = nil;
    //整个工程只调用一次，只创建一个对象
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        studentModelInstance = [[super allocWithZone:NULL] init];
    });
    return studentModelInstance;
}

+ (instancetype) allocWithZone:(struct _NSZone *)zone {
    return [self sharedStudentModel];

}
@end
