//
//  ViewController.m
//  UIBase05
//
//  Created by lsb on 2022/5/19.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSTimer *timer;

-(void)nextImg;

- (IBAction)pageControlClick:(UIPageControl *)sender;

@property (assign, nonatomic) int index;
@end

@implementation ViewController

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"计时器停止");
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"计时器开始");
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.index = ((self.imgScrollView.contentOffset.x + self.imgScrollView.frame.size.width / 2) / self.imgScrollView.frame.size.width);
    self.pageControl.currentPage = self.index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 1; i < 6; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img_0%d", i]];
        UIImageView *imageView = [UIImageView new];
        [self.imgScrollView addSubview:imageView];
        [imageView setImage:image];
        imageView.frame = CGRectMake(self.imgScrollView.frame.size.width * (i - 1), 0, self.imgScrollView.frame.size.width, self.imgScrollView.frame.size.height);
    }
    [self.imgScrollView setContentSize:CGSizeMake(self.imgScrollView.frame.size.width * 5, self.imgScrollView.frame.size.height)];
    self.imgScrollView.showsHorizontalScrollIndicator = NO;
    self.imgScrollView.pagingEnabled = YES;
    
    self.pageControl.frame = CGRectMake(self.pageControl.frame.origin.x, self.pageControl.frame.origin.y - 50, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
    [self.view bringSubviewToFront:self.pageControl];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    self.timer = timer;
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)nextImg{
//    NSLog(@"%ld", self.pageControl.currentPage);
    if (self.pageControl.currentPage < 4){
        [self.imgScrollView setContentOffset:CGPointMake(self.imgScrollView.frame.size.width * (self.pageControl.currentPage + 1), 0)];
        
    }else{
        [self.imgScrollView setContentOffset:CGPointMake(0, 0)];
        self.pageControl.currentPage = 0;
    }
}

- (IBAction)pageControlClick:(UIPageControl *)sender {
    [self.imgScrollView setContentOffset:CGPointMake(self.imgScrollView.frame.size.width * sender.currentPage, 0)];
}
@end
