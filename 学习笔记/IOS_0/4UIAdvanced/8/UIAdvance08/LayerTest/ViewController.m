//
//  ViewController.m
//  LayerTest
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)changeLineWidth:(id)sender;

@property(nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *t = touches.anyObject;
//    CGPoint p = [t locationInView:t.view];
    // 默认有隐性的动画效果，根layer没有，但是子layer有
    
    // 关闭隐性动画效果
//    [CATransaction begin]; // 开启事务
//    [CATransaction setDisableActions:YES]; // 禁用 隐式动画
//    self.layer.position = p;
//    [CATransaction commit]; // 提交事务

    // 旋转 没有make在上一次的基础上旋转
//    self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI_4, 1, 0, 0);
    
    // 缩放
//    self.layer.transform = CATransform3DScale(self.layer.transform, 0.5, 0.5, 0.5);
    
    // 平移
//    self.layer.transform = CATransform3DTranslate(self.layer.transform, 10, 0, 0);
}

-(void) test2{
    // 自定义layer
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = CGPointMake(200, 200); // 位置
    layer.bounds = CGRectMake(0, 0, 100, 100); // 大小
    
    layer.anchorPoint = CGPointMake(0.5, 0.7); // 将定位点设置在x的0.5和y的0.7的位置
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
}

- (void) test1{
    // 通过layer设置一些属性
    
    UIView *redView = [[UIView alloc] init];
    
    redView.frame  = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    
    // 边框
    redView.layer.borderWidth = 10;
    redView.layer.borderColor = [UIColor grayColor].CGColor;
    
    // 阴影
    redView.layer.shadowOffset = CGSizeZero;// 阴影的偏移量
    redView.layer.shadowColor = [UIColor blueColor].CGColor;
    redView.layer.shadowRadius = 50; // 阴影的半径
    redView.layer.shadowOpacity = 1;// 阴影的透明度
    
    // 圆角
    redView.layer.cornerRadius = 50; //圆角半径
    redView.layer.masksToBounds = YES; // 裁剪超出layer的范围的东西
    // bounds 设置
    redView.layer.bounds = CGRectMake(0, 0, 200, 200);
    // position属性和view.center的关系 center跑到position的位置
    redView.layer.position = CGPointMake(0, 0);
    // 设置图片
//    redView.layer.contents = (_bridge id)([UIImage imageNamed:@"me"].CGImage);
    
    [self.view addSubview:redView];
}


@end
