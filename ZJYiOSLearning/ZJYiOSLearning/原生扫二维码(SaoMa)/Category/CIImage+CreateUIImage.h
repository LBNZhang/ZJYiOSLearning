//
//  CIImage+CreateUIImage.h
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/19.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@interface CIImage (CreateUIImage)

/** 将CIImage转换成UIImage */
- (UIImage *)SG_createNonInterpolatedWithSize:(CGFloat)size;

@end
