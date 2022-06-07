//
//  ViewController.m
//  UIAdvance07
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"
#import "TouchTestView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet TouchTestView *touchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    
    CGPoint currentPoint =[touch locationInView:self.view];
    
    self.touchView.center = CGPointMake(self.touchView.center.x + currentPoint.x - previousPoint.x, self.touchView.center.y + currentPoint.y - previousPoint.y);
}


@end
