//
//  LSBFriend.h
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSBFriend : NSObject

@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign, getter=isVip) BOOL vip;

-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype) friendWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
