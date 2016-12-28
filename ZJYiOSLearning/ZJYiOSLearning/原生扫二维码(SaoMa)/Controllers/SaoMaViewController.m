//
//  SaoMaViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/19.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "SaoMaViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SaoMaViewController ()<AVCaptureMetadataOutputObjectsDelegate>

@end

@implementation SaoMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //生成二维码
    [self setupGenerateQRCode];
}

// 生成二维码
- (void)setupGenerateQRCode {
    
    // 1、创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 2、设置数据
    NSString *info = @"https://github.com/kingsic";
    // 将字符串转换成
    NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    
    // 通过KVC设置滤镜inputMessage数据
    [filter setValue:infoData forKeyPath:@"inputMessage"];
    
    // 3、获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 4、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 80;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 5、将CIImage转换成UIImage，并放大显示
    imageView.image = [outputImage SG_createNonInterpolatedWithSize:imageViewW];
}

@end
