//
//  LSBFriendCell.h
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import <UIKit/UIKit.h>
#import "LSBFriend.h"
NS_ASSUME_NONNULL_BEGIN

@interface LSBFriendCell : UITableViewCell
@property(nonatomic, strong) LSBFriend *friend;

+ (instancetype) cellReusedWithTableView:(UITableView *) tableView;
@end

NS_ASSUME_NONNULL_END
