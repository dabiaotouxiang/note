//
//  ViewController.m
//  ClipImage
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", NSHomeDirectory());

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 3. 获取图片
    UIImage *image = [UIImage imageNamed:@"My"];
    // 4. margin
    CGFloat margin = 20;
    
    // 5 计算图片类型的图形上下文的大小
    CGSize ctxSize = CGSizeMake(image.size.width + 2 *margin, image.size.height + 2 * margin);
    
    // 1 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, [UIScreen mainScreen].scale);
    // 6.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 7. 计算圆心
    CGPoint arcCenter = CGPointMake(ctxSize.width * 0.5, ctxSize.height * 0.5);
    // 8. 计算半径
    CGFloat radius  = (image.size.width + margin) * 0.5;
    // 画圆环
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, radius, 0, 2 * M_PI, 1);
    
    // 设置宽度
    CGContextSetLineWidth(ctx, margin);
    
    // 渲染圆环
    CGContextStrokePath(ctx);
    // 画头像显示的区域
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, image.size.width * 0.5, 0, 2 * M_PI, 1);
    // 裁剪显示区域
    CGContextClip(ctx);
    // 画图片
    [image drawAtPoint:CGPointMake(margin, margin)];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}

@end
