//
//  LSBAppCell.h
//  AppManagement
//
//  Created by lsb on 2022/5/24.
//

#import <UIKit/UIKit.h>
#import "LSBAppModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol LSBAppCellDelegate <NSObject>

-(void)showLabel;

@end

@interface LSBAppCell : UITableViewCell

@property(nonatomic, strong) LSBAppModel *appModel;

@property(nonatomic, weak) id<LSBAppCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
