//
//  GBTableViewCell.m
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "GBTableViewCell.h"

@interface GBTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;


@end

@implementation GBTableViewCell

- (void)setCellModel:(GBCellModel *)cellModel{
    _cellModel = cellModel;
    self.icon.image = [UIImage imageNamed:cellModel.icon];
    self.title.text = cellModel.title;
    self.price.text = [NSString stringWithFormat:@"¥ %@", cellModel.price];
    self.buyCount.text = [NSString stringWithFormat:@"%@ 人已购买", cellModel.buyCount];
}

+(instancetype)gBTableViewCellFromFile{
    return [[[NSBundle mainBundle] loadNibNamed:@"GBTableViewCell" owner:nil options:nil] firstObject];
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
