//
//  StudentModel.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/9.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@interface StudentModel : NSObject

@property NSString* name;
@property NSString* sex;
@property NSInteger age;
+ (StudentModel *)sharedStudentModel;
@end
