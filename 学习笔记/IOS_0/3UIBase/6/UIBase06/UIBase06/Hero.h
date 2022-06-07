//
//  Hero.h
//  UIBase06
//
//  Created by lsb on 2022/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hero : NSObject
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *name;

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) heroWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
