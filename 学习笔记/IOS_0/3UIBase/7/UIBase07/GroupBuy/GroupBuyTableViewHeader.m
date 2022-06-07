//
//  GroupBuyTableViewHeader.m
//  GroupBuy
//
//  Created by lsb on 2022/5/22.
//

#import "GroupBuyTableViewHeader.h"

@interface GroupBuyTableViewHeader () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *adScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *adPageControl;
@property (assign, nonatomic) int index;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation GroupBuyTableViewHeader

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImg{
    if (self.index < 4){
        self.adScrollView.contentOffset = CGPointMake(self.adScrollView.contentOffset.x + self.adScrollView.frame.size.width, 0);
    }else{
        self.adScrollView.contentOffset = CGPointMake(0, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.index = (self.adScrollView.contentOffset.x + (self.adScrollView.frame.size.width / 2 )) / self.adScrollView.frame.size.width;
    self.adPageControl.currentPage = self.index;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    for (int i = 0; i < 5 ; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_0%d", i]];
        UIImageView *imageView = [UIImageView new];
        imageView.image = image;
        imageView.frame = CGRectMake(self.adScrollView.frame.size.width * i, 0, self.adScrollView.frame.size.width, self.adScrollView.frame.size.height);
        [self.adScrollView addSubview:imageView];
    }
    self.adScrollView.contentSize = CGSizeMake(self.adScrollView.frame.size.width * 5, self.adScrollView.frame.size.height);
    self.adPageControl.currentPage = 0;
    self.adScrollView.pagingEnabled = YES;
    self.adScrollView.showsHorizontalScrollIndicator = NO;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

+ (instancetype)loadNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"GroupBuyTableViewHeader" owner:nil options:nil]firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
