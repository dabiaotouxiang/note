//
//  WBStatus.h
//  WeiboRepeat
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBStatus : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *picture;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype) initWithDict:(NSDictionary *)dict;

+(instancetype) statusWithDict:(NSDictionary *)dict;

+(NSArray *) statusesFromFile;

@end

NS_ASSUME_NONNULL_END
