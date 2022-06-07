//
//  LotteryTabBar.m
//  Lottery
//
//  Created by lsb on 2022/6/1.
//

#import "LotteryTabBar.h"
@interface LotteryTabBar ()

@end

@implementation LotteryTabBar

- (void)setDelegate:(id<LotteryTabBarDelegate>)delegate{
    _delegate = delegate;
    for (LotteryButton *button in self.subviews){
        if ([_delegate respondsToSelector:@selector(barButtonClick:)]){
            [button addTarget:_delegate action:@selector(barButtonClick:) forControlEvents:UIControlEventTouchDown];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame andNum:(NSInteger) num{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width / num;
        
        for (int i = 0; i < num ; i ++){
            LotteryButton *button = [LotteryButton new];
            button.frame = CGRectMake(i * width, 0, width, frame.size.height);
            button.tag = i;
            [self addSubview:button];
        }
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void) setImageWithIndex:(int) index andImage:(UIImage *) image andImageSel:(UIImage *) imageSel{
    LotteryButton *button = self.subviews[index];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:imageSel forState:UIControlStateSelected];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
