//
//  XuLieHua.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/26.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "XuLieHua.h"

@implementation XuLieHua

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"nameKey"];
    [aCoder encodeInteger:self.no forKey:@"noKey"];
    [aCoder encodeObject:self.sex forKey:@"sexKey"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"nameKey"];
        self.no = [aDecoder decodeIntegerForKey:@"noKey"];
        self.sex = [aDecoder decodeObjectForKey:@"sexKey"];
    }
    return self;
}

@end
