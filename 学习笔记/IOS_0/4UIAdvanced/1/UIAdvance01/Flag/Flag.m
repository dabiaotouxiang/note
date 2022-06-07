//
//  Flag.m
//  Flag
//
//  Created by lsb on 2022/5/25.
//

#import "Flag.h"

@implementation Flag

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)flagsFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NationalFlag" ofType:@"plist"];
    
    NSArray *flagDicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *flags = [NSMutableArray new];
    for (NSDictionary *dict in flagDicts) {
        [flags addObject:[self flagWithDict:dict]];
    }
    return flags;
}

@end
