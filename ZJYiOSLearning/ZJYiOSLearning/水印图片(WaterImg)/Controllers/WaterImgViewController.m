//
//  WaterImgViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/15.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "WaterImgViewController.h"

@interface WaterImgViewController ()

@end

@implementation WaterImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imgView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 150, 200, 300)];
    UIImage* maskImg = [UIImage imageNamed:@"kongque"];
    maskImg = [self imageByApplyingAlpha:0.3 image:maskImg];
    imgView.image = [self addImage:[UIImage imageNamed:@"xiaohua"] addMsakImage:maskImg msakRect:CGRectMake(50 , 50, 50, 50)];
    [self.view addSubview:imgView];
}

/**
 加半透明水印
 @param useImage 需要加水印的图片
 @returns 加好水印的图片
 */
- (UIImage *)addImage:(UIImage *)useImage addMsakImage:(UIImage *)maskImage msakRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    //四个参数为水印图片的位置
    [maskImage drawInRect:rect];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
