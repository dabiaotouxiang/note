//
//  Province.h
//  Provinces
//
//  Created by lsb on 2022/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Province : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) NSArray *cities;

- (instancetype) initWithDict:(NSDictionary *) dict;

+ (instancetype) provinceWithDict:(NSDictionary *) dict;

+ (NSArray *) provincesFromFile;

@end

NS_ASSUME_NONNULL_END
