//
//  ViewController.m
//  CAAnimationTest
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
- (IBAction)clear:(UIBarButtonItem *)sender {
}
- (IBAction)changeColor:(UIButton *)sender {
}
- (IBAction)changeColor:(UIButton *)sender {
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    // 创建基本动画
//    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
//    // 怎么做动画 从哪到哪
//    anim.keyPath = @"position.x";
////    anim.fromValue = @(10);
////    anim.toValue = @(300);
//    // 在自身的基础上
//    anim.byValue = @(10);
//    // 不希望返回原来的位置
//    anim.fillMode = kCAFillModeForwards;
//    anim.removedOnCompletion = NO;
//    // 添加动画
//    [self.view.layer addAnimation:anim forKey:nil];
    
    
    // 关键帧动画
    CAKeyframeAnimation *anim = [[CAKeyframeAnimation alloc] init];
//    anim.keyPath = @"position";
//    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *v2= [NSValue valueWithCGPoint:CGPointMake(150, 100)];
//    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
//    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
//    anim.values = @[v1, v2, v3, v4];
//    // 时间
//    anim.duration = 5;
//    // 重复
//    anim.repeatCount = 0;
//    [self.view.layer addAnimation:anim forKey:nil];
    
    //路径动画
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(500, 500) radius:500 startAngle:0 endAngle:2 * M_PI clockwise:1];
    anim.path = path.CGPath;
    
    anim.duration = 2;
    anim.repeatCount = INT_MAX;
    [self.view.layer addAnimation:anim forKey:nil];
    
    // 组动画
//    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
//    group.animations = @[anim, anim1];
    
    // 过度动画
    CATransition *anim3 = [[CATransition alloc] init];
    anim3.type = @"cube";
    // 动画类型
    anim3.subtype = kCATransitionFromLeft;
}

@end
//
