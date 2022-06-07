//
//  TableHeader.m
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "TableHeader.h"

@interface TableHeader () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (assign, nonatomic) int index;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation TableHeader

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

+ (instancetype)tableHeaderFromFile{
    return [[[NSBundle mainBundle] loadNibNamed:@"TableHeader" owner:nil options:nil] firstObject];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.index = (self.scrollView.contentOffset.x + (self.scrollView.frame.size.width) / 2) / self.scrollView.frame.size.width;
    self.pageControl.currentPage = self.index;
}

- (void)nextImg{
    if (self.index < 4){
        self.scrollView.contentOffset = CGPointMake((self.index + 1) * self.scrollView.frame.size.width , 0);
    }else{
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.index = 0;
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];
    for (int i = 0; i < 5; i++){
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"ad_0%d", i]]];
        [self.scrollView addSubview:imgView];
        imgView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 5, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
