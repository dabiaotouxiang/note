//
//  CellModel.h
//  Weibo
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellModel : NSObject
@property(nonatomic, copy)NSString *text;
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *picture;
@property(nonatomic, assign)BOOL vip;

- (instancetype) initWithDict:(NSDictionary *) dict;

+ (instancetype) cellModelWithDict:(NSDictionary *)dict;

+ (NSArray *) cellModelsFromFile;

@end

NS_ASSUME_NONNULL_END
