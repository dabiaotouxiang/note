//
//  Question.h
//  UIBase04
//
//  Created by lsb on 2022/5/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *answer;

@property(nonatomic, strong) NSArray *options;

-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype) questionWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
