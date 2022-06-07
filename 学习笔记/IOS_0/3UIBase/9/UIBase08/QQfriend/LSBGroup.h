//
//  LSBGroup.h
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSBGroup : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int online;
@property(nonatomic, strong) NSArray *friends;
@property(nonatomic, assign) BOOL show;

- (instancetype) initWithDict:(NSDictionary *) dict;

+ (instancetype) groupWithDict:(NSDictionary *) dict;

+ (NSArray *) groupsFromFile;

@end

NS_ASSUME_NONNULL_END
