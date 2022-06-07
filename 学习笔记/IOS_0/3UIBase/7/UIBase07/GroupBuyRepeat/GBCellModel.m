//
//  GBCellModel.m
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "GBCellModel.h"

@implementation GBCellModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)gBCellModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)gBCellModelsFromFile{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
    
    NSArray *cellModelDicts = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSDictionary *dict in cellModelDicts){
        [array addObject:[self gBCellModelWithDict:dict]];
    }
    return array;
}

@end
