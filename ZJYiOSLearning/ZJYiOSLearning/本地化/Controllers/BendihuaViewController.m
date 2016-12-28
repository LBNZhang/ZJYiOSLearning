//
//  BendihuaViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/9.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "BendihuaViewController.h"

@interface BendihuaViewController ()

@end



@implementation BendihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* lblTitle = NSLocalizedString(@"lbl", nil);
    self.lbl.text = lblTitle;
    
    NSString* imgViewName = NSLocalizedString(@"xiaohua", nil);
    self.imgView.image = [UIImage imageNamed:imgViewName];
    
    StudentModel* studentModel1 = [StudentModel sharedStudentModel];
    StudentModel* studentModel2 = [StudentModel sharedStudentModel];
    NSLog(@"studentModel1的地址是：%@",studentModel1);
    NSLog(@"studentModel2的地址是：%@",studentModel2);
}


@end
