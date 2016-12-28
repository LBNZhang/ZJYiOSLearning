//
//  AFNetworkingViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/12/1.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "AFNetworkingViewController.h"
#define boundary @"AaB03x" //设置边界 参数可以随便设置
@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self post];
}

- (void)post {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://218.244.128.140:8080/client/v1/shop/Login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSDictionary *dic = @{@"TerminalType":@(3),@"Account":@"内部测试",@"UserName":@"sp",@"Password":@"111111"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, NSDictionary* responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"dic是：%@",responseObject);
            Boolean value = [[responseObject valueForKey:@"Value"] boolValue];
            if (value) {
                [self postImg];
            }else {
                NSLog(@"value为false");
            }
        }
    }];
    [dataTask resume];
}

- (void)postImg {
    NSLog(@"我这里调用到了");
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://218.244.128.140:8080/client/v1/Stock/UploadStockImg?imgId=85209&isDefaultImg=true&imgSource=4&stockId=121002"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data;charset=utf-8;boundary=%@",boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSData *data = [self requestHTTPBody];
    request.HTTPBody = data;
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error:%@",error);
        }else {
            NSLog(@"%@ %@",response,responseObject);
            NSLog(@"dic是：%@",responseObject);
            Boolean value = [[responseObject valueForKey:@"Value"] boolValue];
            if (value) {
                NSLog(@"请求接口成功");
            }else {
                NSLog(@"value为false");
            }
        }
    }];
    [dataTask resume];
}

- (NSData*)requestHTTPBody {
    //string
    NSMutableData *bodyData = [NSMutableData data];
    //(1)access_token
    NSMutableString *header1String = [[NSMutableString alloc] init];
    [header1String appendFormat:@"--%@\r\n", boundary];//（一开始的 --也不能忽略）
    [header1String appendFormat:@"Content-Disposition: form-data; name=\"access_token\"\r\n\r\n"];
    [header1String appendFormat:@"1234\r\n"];
    [bodyData appendData:[header1String dataUsingEncoding:NSUTF8StringEncoding]];
    //(2)status
    NSMutableString *header2String = [[NSMutableString alloc] init];
    [header2String appendFormat:@"--%@\r\n", boundary];
    [header2String appendFormat:@"Content-Disposition: form-data; name=\"status\"\r\n\r\n"];
    [header2String appendFormat:@"带图片的微博\r\n"];
    [bodyData appendData:[header2String dataUsingEncoding:NSUTF8StringEncoding]];
    //(3)pic1
    NSMutableString *header3String = [[NSMutableString alloc] init];
    [header3String appendFormat:@"--%@\r\n", boundary];
    //声明pic字段，文件名为boris.png
    [header3String appendFormat:@"Content-Disposition: form-data; name=\"imgFile\"; filename=\"iosImg.jpg\"\r\n"];
    //声明上传文件的格式
    [header3String appendFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
    [bodyData appendData:[header3String dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *file1Data = UIImagePNGRepresentation([UIImage imageNamed:@"xiaohua"]);
    [bodyData appendData:file1Data];
    //4.结束的分隔线
    NSString *endStr = [NSString stringWithFormat:@"\r\n--%@--\r\n",boundary];
    //拼接到bodyData最后面
    [bodyData appendData:[endStr dataUsingEncoding:NSUTF8StringEncoding]];
    return bodyData;
}
@end
