//
//  Product.m
//  GroupBuy
//
//  Created by lsb on 2022/5/21.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)loadFromFile{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
    NSArray *productDicts = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *products = [NSMutableArray new];
    
    for (NSDictionary *productDict in productDicts){
        [products addObject:[self productWithDict:productDict]];
    }
    return products;
}

@end
