//
//  LSBHeaderView.h
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import <UIKit/UIKit.h>
#import "LSBGroup.h"
@class LSBHeaderView;
NS_ASSUME_NONNULL_BEGIN

@protocol LSBHeaderViewDelegate <NSObject>

-(void) reloadGroupSection:(LSBHeaderView *) headerView;

@end

@interface LSBHeaderView : UITableViewHeaderFooterView
@property(nonatomic, strong) LSBGroup *group;
@property(nonatomic, weak) id<LSBHeaderViewDelegate> delegate;
+ (instancetype) headerReusedWithTableView:(UITableView *) tableView;

@end

NS_ASSUME_NONNULL_END
