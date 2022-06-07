//
//  LSBFriend.m
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import "LSBFriend.h"

@implementation LSBFriend

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
