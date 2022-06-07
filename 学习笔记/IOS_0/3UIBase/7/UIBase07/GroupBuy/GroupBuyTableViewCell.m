//
//  GroupBuyTableViewCell.m
//  GroupBuy
//
//  Created by lsb on 2022/5/21.
//

#import "GroupBuyTableViewCell.h"

@interface GroupBuyTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;


@end

@implementation GroupBuyTableViewCell

- (void)setModel:(Product *)model{
    self.imgView.image = [UIImage imageNamed:model.icon];
    
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", model.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已经购买", model.buyCount];
}

+ (instancetype)loadNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"GroupBuyTableViewCell" owner:nil options:nil] firstObject];
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
