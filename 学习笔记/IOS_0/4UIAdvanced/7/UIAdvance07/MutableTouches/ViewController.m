//
//  ViewController.m
//  MutableTouches
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
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches){
        CGPoint p = [t locationInView:t.view];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
        imageView.bounds = CGRectMake(0, 0, 10, 10);
        imageView.center = p;
        [self.view addSubview:imageView];
        [UIView animateWithDuration:2 animations:^{
                    imageView.alpha = 0;
                } completion:^(BOOL finished) {
                    [imageView removeFromSuperview];
                }];
    }
}


@end
