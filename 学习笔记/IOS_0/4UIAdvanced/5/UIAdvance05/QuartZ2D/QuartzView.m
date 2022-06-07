//
//  QuartzView.m
//  QuartZ2D
//
//  Created by lsb on 2022/5/28.
//

#import "QuartzView.h"

@implementation QuartzView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:-M_PI_2 endAngle:-M_PI_2 + 2 * M_PI * self.value clockwise:1];
    [path addLineToPoint:CGPointMake(150, 150)];
    [[UIColor redColor] set];
    
    [path fill];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 重画
//    [self setNeedsDisplay];
    // 重画一部分
    [self setNeedsDisplayInRect:CGRectMake(0, 0, 300, 150)];
}

-(void) test13:(CGRect)rect{
    // 柱状图
    NSArray *array = @[@1, @0.5, @0.7, @0.3, @0.1, @0.6];
    for (int i = 0; i<array.count; i++){
        CGFloat w = 20;
        CGFloat h = [array[i] floatValue] * rect.size.height;
        CGFloat x = i * 2* w;
        CGFloat y = rect.size.height - h;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];;
        [[UIColor colorWithRed:((float) arc4random_uniform(256)/ 255.0) green:((float) arc4random_uniform(256)/ 255.0) blue:((float) arc4random_uniform(256)/ 255.0) alpha:1] set];
        
        [path fill];
    }
}

-(void) test12{
    // 扇形图
    NSArray *array = @[@0.3, @0.1, @0.2, @0.4];
    CGFloat start = 0;
    CGFloat end = 0;
    
    for (int i = 0; i<array.count; i++){
        end = 2 * M_PI * [array[i] floatValue] + start;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:start endAngle:end clockwise:1];
        [path addLineToPoint:CGPointMake(150, 150)];
        [[UIColor colorWithRed:((float) arc4random_uniform(256)/ 255.0) green:((float) arc4random_uniform(256)/ 255.0) blue:((float) arc4random_uniform(256)/ 255.0) alpha:1] set];
        
        [path fill];
        
        start = end;
    }
}

-(void) test11{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    // 拼接路径
//    CGContextMoveToPoint(ctx, 50, 50);
//    CGContextAddLineToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 150, 50);
//    // 封闭路径
//    CGContextClosePath(ctx);
//    // 描边 喵边不填充
////    CGContextStrokePath(ctx);
//    // 或者是
////    CGContextDrawPath(ctx, kCGPathStroke);
//    // 设置填充颜色
//    CGContextSetLineWidth(ctx, 30);
//    [[UIColor blueColor] setStroke];
//    [[UIColor redColor]setFill];
//    // 填充 填充不喵边
////    CGContextFillPath(ctx);
//    // 即填充又喵边
//    CGContextDrawPath(ctx, kCGPathFillStroke);

    
    // OC代码
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 50)];
    
    [path closePath];
    
    [path setLineWidth:10];
    
    [[UIColor redColor] setFill];
    [[UIColor blueColor] setStroke];
    // 设置所有的颜色, 并且覆盖原来的颜色
    [[UIColor greenColor] set];
    // 瞄边
    [path stroke];
    // 填充
    [path fill];
}


-(void) test10{
//    // 线宽
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    // 拼接路径
//    CGContextMoveToPoint(ctx, 50, 50);
//
//    CGContextAddLineToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 150, 50);
//    // 设置线宽
//    CGContextSetLineWidth(ctx, 30);
//    // 设置连接处样式
//    //kCGLineJoinMiter 默认样式
//    //kCGLineJoinRound 圆角
//    //kCGLineJoinBevel 切角
//    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
//
//    // 设置头尾的样式
//    //kCGLineCapButt 默认
//    // kCGLineCapRound 圆角
//    // kCGLineCapSquare 线宽包裹线的尾部
//    CGContextSetLineCap(ctx, kCGLineCapButt);
//    // 设置颜色
//    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
//  [[UIColor redColor] setStroke];
//    CGContextStrokePath(ctx);
    
    // oc代码
    UIBezierPath *path = [UIBezierPath new];

    // 拼接路径
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 50)];

    [path setLineWidth:30];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    // 设置线的颜色
    [[UIColor redColor] setStroke];
    [path stroke];
    

}

- (void) test9{
    // 画圆
    // clockwise 是否顺时针 画弧线 startAngle是三点钟的位置
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:1];
//    [path stroke];
    
    // C语言画圆
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    // 最后一个是是否顺时针，但是在iOS上1代表逆时针，在MAC上，1代表顺时针
    CGContextAddArc(ctx, 150, 150, 100, -M_PI_2, M_PI_2, 1);
    
    CGContextStrokePath(ctx);
}

-(void) test8{
    //oc椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 100)];
//    [path stroke];
    
    //C椭圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 200, 100));
    
    
    CGContextStrokePath(ctx);
}

-(void) test7{
    // 画矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 100)];
    // 圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:10];
    [path stroke];
}

- (void) test6{
    // 全OC
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    
    // 直接渲染
    [path stroke];
}

-(void) test5{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // C中的字符串
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    
    // 拼接字符串 oc
    UIBezierPath *path1 = [UIBezierPath bezierPathWithCGPath:path];
    [path1 addLineToPoint:CGPointMake(150, 50)];
    
    CGContextAddPath(ctx, path1.CGPath);
    
    CGContextStrokePath(ctx);
    
}

-(void) test1{
    // C画直线
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 指定起点
    CGContextMoveToPoint(ctx, 50, 50);
    // 从起点画线到指定的终点
    CGContextAddLineToPoint(ctx, 100, 100);
    // 开始将画布的内容加到view上
    CGContextStrokePath(ctx);
}

-(void) test2{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 先画一个折线，再画一条直线，不想交不相连
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);
    
    CGContextMoveToPoint(ctx, 50, 200);
    CGContextAddLineToPoint(ctx, 200, 200);
    
    CGContextStrokePath(ctx);
}

-(void)test3{
    // 先拼接路径，然后将路径添加至画布，然后再渲染
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 拼接路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
}
-(void) test4{
    //C +OC的方法
    // 获取上下文
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    
    // oc中的拼接路径
    UIBezierPath *path = [[UIBezierPath new] init];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    // 添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 渲染
    CGContextStrokePath(ctx);
}

@end
