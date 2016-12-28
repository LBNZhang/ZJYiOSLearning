//
//  NetworkRequestViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/18.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "NetworkRequestViewController.h"
#define boundary @"AaB03x" //设置边界 参数可以随便设置
@interface NetworkRequestViewController ()

@end

@implementation NetworkRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self post];
}
//非表单的请求
- (void)post {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://218.244.128.140:8080/client/v1/shop/Login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSDictionary *dic = @{@"TerminalType":@(3),@"Account":@"内部测试",@"UserName":@"sp",@"Password":@"111111"};
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //最外面也要根据error先进行判断
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dict);
        Boolean value = [[dict valueForKey:@"Value"] boolValue];
        if (value) {
            [self requstPostImageAction];
        }else {
            //提示返回错误
        }
    }];
    [dataTask resume];
}

//表单，有key value必须用下面的表单拼接httpbody
- (void)requstPostImageAction {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://218.244.128.140:8080/client/v1/Stock/UploadStockImg?imgId=85209&isDefaultImg=true&imgSource=4&stockId=121002"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=utf-8;boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSData *data = [self requestHTTPBody];;
    request.HTTPBody = data;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            //把获取到的东西以plist的方式存入文件中，再在文件夹中找到沙盒路径双击打开
            NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *) response;
            NSLog(@"httpResponse是：%@",httpResponse);
            NSLog(@"url = %@", httpResponse.URL);
            NSLog(@"body = %@", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
            NSLog(@"status = %ld",httpResponse.statusCode);
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *plistPath = [paths objectAtIndex:0];
            NSString *fileName = [plistPath stringByAppendingPathComponent:@"result.txt"];
            NSLog(@"路径名：%@",fileName);
            //这里必须放字符串
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:httpResponse.URL.absoluteString,@"URL",[NSNumber numberWithInteger:httpResponse.statusCode],@"statusCode", nil];
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
            NSString *jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonStr是：%@",jsonStr);
            [jsonStr writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    }];
    [dataTask resume];
    
}


//表单要用的方法
- (NSData*) requestHTTPBody {
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
