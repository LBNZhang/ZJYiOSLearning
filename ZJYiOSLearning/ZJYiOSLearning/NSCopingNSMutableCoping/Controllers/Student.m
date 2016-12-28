//
//  Student.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone {
    Student* student = [[[self class]allocWithZone:zone]init];
    student.name = self.name;
    student.age = self.age;
    student.sex = self.sex;
    return student;
}

@end
