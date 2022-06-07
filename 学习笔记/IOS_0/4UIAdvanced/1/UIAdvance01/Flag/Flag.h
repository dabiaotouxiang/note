//
//  Flag.h
//  Flag
//
//  Created by lsb on 2022/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Flag : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *icon;

-(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) flagWithDict:(NSDictionary *) dict;
+ (NSArray *) flagsFromFile;

@end

NS_ASSUME_NONNULL_END
