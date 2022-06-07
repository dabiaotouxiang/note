//
//  WBStatus.m
//  WeiboRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "WBStatus.h"

@implementation WBStatus

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype) statusWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];;
}

+(NSArray *)statusesFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses" ofType:@"plist"];
    
    NSArray *statusDicts = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *statusModels = [NSMutableArray new];
    for (NSDictionary *dict in statusDicts){
        [statusModels addObject:[self statusWithDict:dict]];
    }
    return statusModels;
}

@end
