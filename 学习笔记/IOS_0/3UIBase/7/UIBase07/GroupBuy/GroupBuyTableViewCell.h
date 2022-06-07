//
//  GroupBuyTableViewCell.h
//  GroupBuy
//
//  Created by lsb on 2022/5/21.
//

#import <UIKit/UIKit.h>
#import "Product.h"
NS_ASSUME_NONNULL_BEGIN

@interface GroupBuyTableViewCell : UITableViewCell

@property (nonatomic, strong) Product *model;

+ (instancetype) loadNib;

@end

NS_ASSUME_NONNULL_END
