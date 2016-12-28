//
//  Student.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Student : NSObject<NSCopying>
//string用copy
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSString* sex;
@end
