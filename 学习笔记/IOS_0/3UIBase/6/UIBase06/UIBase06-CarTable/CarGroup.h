//
//  CarGroup.h
//  CarTable
//
//  Created by lsb on 2022/5/21.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface CarGroup : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) NSArray *cars;

-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype) carGroupWithDict:(NSDictionary *) dict;

+(NSArray *) loadCarGroupsFromFile;
@end

NS_ASSUME_NONNULL_END
