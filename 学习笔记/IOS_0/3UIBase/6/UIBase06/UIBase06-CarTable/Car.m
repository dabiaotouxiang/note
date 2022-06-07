//
//  Car.m
//  CarTable
//
//  Created by lsb on 2022/5/21.
//

#import "Car.h"

@implementation Car

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
