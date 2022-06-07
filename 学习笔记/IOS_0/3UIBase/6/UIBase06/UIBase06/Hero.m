//
//  Hero.m
//  UIBase06
//
//  Created by lsb on 2022/5/21.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
        self.icon = @"img_01";
    }
    return self;
}

+(instancetype)heroWithDict:(NSDictionary *)dict{
    return [[Hero alloc] initWithDict:dict];
}

@end
