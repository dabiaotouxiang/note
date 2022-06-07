//
//  FlagView.m
//  Flag
//
//  Created by lsb on 2022/5/25.
//

#import "FlagView.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *flagImg;


@end

@implementation FlagView

+ (instancetype)flagViewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"flagView" owner:nil options:nil]firstObject];
}

- (void)setFlag:(Flag *)flag{
    _flag = flag;
    self.nameLabel.text = flag.name;
    self.flagImg.image = [UIImage imageNamed:flag.icon];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
