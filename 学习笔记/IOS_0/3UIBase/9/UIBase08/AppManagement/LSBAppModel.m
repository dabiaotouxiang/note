//
//  LSBAppModel.m
//  AppManagement
//
//  Created by lsb on 2022/5/24.
//

#import "LSBAppModel.h"

@implementation LSBAppModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) appModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appModelsFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"];
    
    NSArray *appModelDicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *array = [NSMutableArray new];
    for (NSDictionary *dict in appModelDicts){
        [array addObject:[self appModelWithDict:dict]];
    }
    return array;
}

@end
