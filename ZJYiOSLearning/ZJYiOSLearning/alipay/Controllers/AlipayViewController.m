//
//  AlipayViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/12/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "AlipayViewController.h"
#import "DataSigner.h"

@interface AlipayViewController ()

@end

@implementation AlipayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"alipay" object:nil];
}

- (void)updateUI:(NSNotification*) notification {
    NSString* string = [notification object];//通过这个获取到传递的对象
    self.lbl.text = string;
}

- (IBAction)payAction:(id)sender {
    NSString *appID = @"2015102100501135";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMjloz0m2OHBKjCdANf9lrZKfcKAk/8a6C68Zi7NjMeIYyoIHxM9wxmVhQV52t3xzVysA61sKQ0YBI/dve5GjB7sjcxFIvhlSx2fY8+gtpzwZHEsnZzjo2DIbVgq6XkfuZ6DSPczmGGq+AS8QNRkjFDELe8zIQwj/VQftbdkA/nNAgMBAAECgYEAhdHprcdduuuX9e/vavDh3qW6JcDOVKUQumkGy/Bh8VvZalskkAWZG0as6Bvmfece+7cdb/zXT4CLMWXsqXbWyGZqAPbkqyA4u0/5LkRnY7FfWRahaYT7i5FLBH5Vydgq0GgUF8nxr1oaRZzBbhOD4EyBQwsKzUnaowlZVU1ZOyECQQD+7DmoqsuGbt+4iZVmUnR/RmMC6v07/fxg5+KSGDZslz97V8VOfXvVjyDE1I047y+Iz7CrRssA+TxTo2J6rr4ZAkEAyb73r79BMkXjLdXSclNcyWnyVOnne5CVOvfFTnJLlY6zz1Ic2SawWo1Hf66wzUV8Mc5npf1I9irVDqUwoDon1QJBAITyp+N6J6jVvCGex2bUy+Lwz4RfD3CxNmVHqhctP30EqFvoW4Ni2Cl5esqMW5Z8z5qXTnkU85xvX3HzPNHkvkkCQFmoMaD8CPhTkLt86/J80557JAPSk1oZjghPtnK/XpHPgl9faYyjofoMETtQIiiHecMUrIFbB8LGlDrW9L4wOiUCQEqSH2bAvZAy1HDcxliX6dZT/Rg97kD8Garn+Oe3RrtTZlvOW975sIcWZDd/NuFDMOL/oxA9a71iLcfWClbnV8Y=";
    //partner和seller获取失败,提示
    if ([appID length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"缺少appId或者私钥。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    Order* order = [Order new];
    order.app_id = appID;
    order.method = @"alipay.trade.app.pay";
    order.charset = @"utf-8";
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    order.version = @"1.0";
    order.sign_type = @"RSA";
    order.biz_content = [BizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"abcdefg";
    order.biz_content.out_trade_no = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderInfo];
    if (signedString != nil) {
        NSString *appScheme = @"ZJYiOSLearningapp";
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
       [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
@end
