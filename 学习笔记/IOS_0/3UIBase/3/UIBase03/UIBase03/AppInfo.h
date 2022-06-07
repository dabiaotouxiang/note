//
//  AppInfo.h
//  UIBase03
//
//  Created by lsb on 2022/5/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppInfo : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *title;

-(instancetype)initWithDict:(NSDictionary *) dict;
+(instancetype)appWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
