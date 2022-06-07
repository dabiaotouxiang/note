//
//  GBCellModel.h
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GBCellModel : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *buyCount;

-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype) gBCellModelWithDict:(NSDictionary *) dict;

+(NSMutableArray *) gBCellModelsFromFile;
@end

NS_ASSUME_NONNULL_END
