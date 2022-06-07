//
//  TableFooter.m
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "TableFooter.h"

@interface TableFooter ()

@property (weak, nonatomic) IBOutlet UIButton *loadBtn;

@property (weak, nonatomic) IBOutlet UIView *loadView;
- (IBAction)loadClick;

@end

@implementation TableFooter

+(instancetype)tableFooterFromFile{
    return [[[NSBundle mainBundle] loadNibNamed:@"TableFooter" owner:nil options:nil] firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loadClick {
    self.loadBtn.hidden = YES;
    self.loadView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(loadMore)]){
            [self.delegate loadMore];
        }
        
        self.loadBtn.hidden = NO;
        self.loadView.hidden = YES;
    });
}
@end
