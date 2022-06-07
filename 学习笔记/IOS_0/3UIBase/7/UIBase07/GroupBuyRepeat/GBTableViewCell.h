//
//  GBTableViewCell.h
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import <UIKit/UIKit.h>
#import "GBCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GBTableViewCell : UITableViewCell

@property(nonatomic, strong) GBCellModel *cellModel;

+(instancetype) gBTableViewCellFromFile;

@end

NS_ASSUME_NONNULL_END
