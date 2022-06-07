//
//  MyView.m
//  UIAdvance06
//
//  Created by lsb on 2022/5/29.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    NSString *str = @"黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员黑马程序员";
    NSString *str = @"黑马程序员";
    
    // 设置shadow的颜色
    NSShadow *shadow = [[NSShadow alloc]init];
    // 阴影的偏移量 就是阴影的开始位置
    shadow.shadowOffset = CGSizeMake(50, 50);
    // 阴影的模糊程度 越小越不模糊
    shadow.shadowBlurRadius = 5;
    // 阴影的颜色
    shadow.shadowColor = [UIColor blueColor];
    
    // 没有任何约束，所有文字在一行
//    [str drawAtPoint:CGPointZero withAttributes:nil];
    // 约束在recr中
//    [str drawInRect:CGRectMake(0, 0, 300, 300) withAttributes:nil];
    // 添加attribute NSFontAttributeName 字体 NSForegroundColorAttributeName 字体颜色
    //NSBackgroundColorAttributeName 背景颜色
    //NSUnderlineStyleAttributeName 下划线 没有下划线这个属性，就没有阴影，即使下划线的大小是0
    [str drawInRect:CGRectMake(0, 0, 300, 300) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:30], NSForegroundColorAttributeName:[UIColor redColor], NSBackgroundColorAttributeName: [UIColor greenColor], NSUnderlineStyleAttributeName: @1, NSShadowAttributeName: shadow}];
}

-(void) testCtm {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 进行矩阵 缩放 平移操作 就在获取上下文后面进行就行
    // 平移操作
    CGContextTranslateCTM(ctx, 100, 100);
    // 旋转
    CGContextRotateCTM(ctx, M_PI_4);
    // 缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    
    CGContextAddArc(ctx, 150, 150, 100, 0, 2*M_PI, 1);
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextSetLineWidth(ctx, 10);
    CGContextStrokePath(ctx);
}

@end
