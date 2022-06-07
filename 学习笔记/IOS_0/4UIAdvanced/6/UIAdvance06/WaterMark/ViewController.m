//
//  ViewController.m
//  WaterMark
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *image  = [UIImage imageNamed:@"my"];
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [UIScreen mainScreen].scale);
    // 画大图
    [image drawAtPoint:CGPointZero];
    // 添加文字
    NSString *str = @"test";
    
//    画文字
    [str drawAtPoint:CGPointMake(20, 20) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];
    // 画图片
    UIImage *logo = [UIImage imageNamed:@"bg"];
    [logo drawAtPoint:CGPointMake(image.size.width * 0.6, image.size.height * 0.7)];
    
    // 取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    // 关闭上下文
    UIGraphicsEndImageContext();
}

@end
