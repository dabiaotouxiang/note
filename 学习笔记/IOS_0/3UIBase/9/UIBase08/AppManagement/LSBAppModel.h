//
//  LSBAppModel.h
//  AppManagement
//
//  Created by lsb on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSBAppModel : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *name;

- (instancetype) initWithDict:(NSDictionary *)dict;

+(instancetype) appModelWithDict:(NSDictionary *)dict;

+ (NSArray *) appModelsFromFile;

@end

NS_ASSUME_NONNULL_END
