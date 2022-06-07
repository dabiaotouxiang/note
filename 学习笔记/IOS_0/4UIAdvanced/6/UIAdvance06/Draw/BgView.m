//
//  BgView.m
//  Draw
//
//  Created by lsb on 2022/5/29.
//

#import "BgView.h"

@implementation BgView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 平铺背景图片
    [[UIImage imageNamed:@"bg"] drawAsPatternInRect:rect];
}


@end
