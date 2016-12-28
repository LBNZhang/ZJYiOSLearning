//
//  GCD1ViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/24.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "GCD1ViewController.h"

@interface GCD1ViewController ()

@end

@implementation GCD1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self gcdTest];
    //[self gcdGroupTest];
    //[self gcdBarrierTest];
    [self taskWithNo:0];
}

- (void)gcdTest {
    //dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //主线程把主线程停掉了，会发生死锁
    //dispatch_queue_t serialQueue = dispatch_get_main_queue();
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        [self taskWithNo:1];
    });
    
}

- (void)gcdGroupTest {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [self taskWithNo:1];
    });
    dispatch_group_async(group, queue, ^{
        [self taskWithNo:2];
    });
    dispatch_group_async(group, queue, ^{
        [self taskWithNo:3];
    });
    dispatch_group_async(group, queue, ^{
        [self taskWithNo:4];
    });
    dispatch_group_notify(group, queue, ^{
        [self taskWithNo:5];
    });
}

- (void)gcdBarrierTest {
    //barrier只能在自己创建的队列里用，获取的global队列不能用
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("barrierQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self taskWithNo:1];
    });
    dispatch_async(queue, ^{
        [self taskWithNo:2];
    });
    dispatch_barrier_async(queue, ^{
        [self taskWithNo:3];
    });
    dispatch_async(queue, ^{
        [self taskWithNo:4];
    });
    dispatch_async(queue, ^{
        [self taskWithNo:5];
    });
}

- (void)taskWithNo:(NSInteger)no {
    for (int i = 0; i < 10; i++) {
        NSLog(@"task%ld",(long)no);
    }
}

- (void)setAge:(int)age {
    NSLog(@"重写set方法");
    _age = age;
}

@end
