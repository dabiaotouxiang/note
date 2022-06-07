//
//  MyView.m
//  Clip
//
//  Created by lsb on 2022/5/29.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"My"];
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画出要显示的区域
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, 1);
    
    // 进行裁剪
    CGContextClip(ctx);
    
    [image drawInRect:rect];
}


@end
