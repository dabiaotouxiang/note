//
//  GroupBuyTableViewFooter.m
//  GroupBuy
//
//  Created by lsb on 2022/5/22.
//

#import "GroupBuyTableViewFooter.h"

@interface GroupBuyTableViewFooter ()

@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIView *loadView;

- (IBAction)clickMore;


@end

@implementation GroupBuyTableViewFooter

+ (instancetype)loadNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"GroupBuyTableViewFooter" owner:nil options:nil]firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)clickMore {
    self.moreButton.hidden = YES;
    
    self.loadView.hidden = NO;
    
    if ([self.delegate respondsToSelector:@selector(addCell:)]){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.delegate addCell:self];
        });
    }
}

- (void)endLoad{
    self.moreButton.hidden = NO;
    
    self.loadView.hidden = YES;
}
@end
