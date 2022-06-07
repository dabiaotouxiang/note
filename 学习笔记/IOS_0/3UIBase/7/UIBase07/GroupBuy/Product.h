//
//  Product.h
//  GroupBuy
//
//  Created by lsb on 2022/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *buyCount;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) productWithDict:(NSDictionary *)dict;
+ (NSMutableArray *) loadFromFile;
@end

NS_ASSUME_NONNULL_END
