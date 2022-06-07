//
//  LSBFriendCell.m
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import "LSBFriendCell.h"

@implementation LSBFriendCell

+ (instancetype)cellReusedWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"friendCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        return [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    return  cell;
}

- (void)setFriend:(LSBFriend *)friend{
    _friend = friend;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    if (friend.isVip){
        self.textLabel.textColor = [UIColor redColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
