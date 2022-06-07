//
//  Province.m
//  Provinces
//
//  Created by lsb on 2022/5/25.
//

#import "Province.h"

@implementation Province

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)provincesFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
    NSArray *provinceDicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *provinces = [NSMutableArray new];
    for (NSDictionary *dict in provinceDicts) {
        [provinces addObject:[self provinceWithDict:dict]];
    }
    return provinces;
}

@end
