//
//  ImgView.m
//  Draw
//
//  Created by lsb on 2022/5/29.
//

#import "ImgView.h"

@implementation ImgView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *image = [UIImage imageNamed:@"My"];
    
    // 从某个点开始绘制
//    [image drawAtPoint:CGPointMake(50, 50)];
    // 把图片绘制到某个区域 拉伸
//    [image drawInRect:rect];
    // 把图片平铺到某一个区域
    [image drawAsPatternInRect:rect];
}


@end
