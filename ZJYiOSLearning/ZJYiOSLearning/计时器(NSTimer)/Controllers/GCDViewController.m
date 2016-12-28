//
//  GCDViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/22.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "GCDViewController.h"
//NSInteger count = 0;


@interface GCDViewController ()
//注意＊＊这里不需要✳️号 可以理解为dispatch_time_t 已经包含了
@property (nonatomic, strong)dispatch_source_t source;
//基本数据类型nsinteger cgfloat必须用assign,其他是对象类型可以用strong，weak
@property (nonatomic,assign) NSInteger count;
@end

@implementation GCDViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //__block NSInteger count = 0;
    NSLog(@"begin");
    //获得队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一个定时器
    self.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置开始时间
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    //设置时间间隔
    uint64_t interval = (uint64_t)(1.0* NSEC_PER_SEC);
    //设置定时器
    dispatch_source_set_timer(self.source, start, interval, 0);
    
    //block里不能有self,否则是对该对象的引用，不能释放
    //__weak GCDViewController* gcdVC = self;
    __weak typeof(self) weakSelf = self;
    
    //设置回调
    dispatch_source_set_event_handler(self.source, ^{
        
        NSLog(@"zjyzjy");
        //设置当执行五次是取消定时器
        //gcdVC.count++;
        if(weakSelf.count == 5){
            NSLog(@"cancel");

            dispatch_cancel(weakSelf.source);
            
        }
    });
    //由于定时器默认是暂停的所以我们启动一下
    //启动定时器
    dispatch_resume(self.source);
    
}

@end
