//
//  CellModel.m
//  Weibo
//
//  Created by lsb on 2022/5/22.
//

#import "CellModel.h"

@implementation CellModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)cellModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)cellModelsFromFile{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"statuses" ofType:@"plist"];
    NSArray *cellModelDicts = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *array = [NSMutableArray new];
    for (NSDictionary *dict in cellModelDicts){
        [array addObject:[self cellModelWithDict:dict]];
    }
    return array;
}

@end
