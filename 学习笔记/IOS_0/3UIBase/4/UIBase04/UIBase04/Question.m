//
//  Question.m
//  UIBase04
//
//  Created by lsb on 2022/5/18.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.answer = dict[@"answer"];
        self.options = dict[@"options"];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
