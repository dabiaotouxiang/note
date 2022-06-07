//
//  AppInfo.m
//  UIBase03
//
//  Created by lsb on 2022/5/16.
//

#import "AppInfo.h"

@implementation AppInfo

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        self.title = dict[@"title"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
