//
//  ViewController.m
//  UIAdvance05
//
//  Created by lsb on 2022/5/28.
//

#import "ViewController.h"
#import "ModalViewController.h"
@interface ViewController ()

@property(nonatomic, strong) UIViewController *controller;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    ModalViewController *controller = [ModalViewController new];
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor blueColor];
//    controller.view = view;
//    self.controller = controller;
//    // 添加modal的特效
//    controller.modalTransitionStyle = UIModalTransitionStylePartialCurl;
//    // modal代码弹出
//    [self presentViewController:controller animated:YES completion:^{
//            NSLog(@"控制器已经显示");
//    }];
//}




@end
