//
//  CarGroup.m
//  CarTable
//
//  Created by lsb on 2022/5/21.
//

#import "CarGroup.h"
#import "Car.h"
@implementation CarGroup

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        NSArray *carDicts = dict[@"cars"];
        
        NSMutableArray *cars = [NSMutableArray new];
        for (NSDictionary *dict in carDicts){
            [cars addObject:[Car carWithDict:dict]];
        }
        self.cars = cars;
    }
    return self;
}

+ (instancetype)carGroupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)loadCarGroupsFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@"plist"];
    
    NSArray *carGroupDicts = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *carGroups = [NSMutableArray new];
    
    for (NSDictionary * carGroupDict in carGroupDicts){
        [carGroups addObject:[self carGroupWithDict:carGroupDict]];
    }
    return carGroups;
}

@end
