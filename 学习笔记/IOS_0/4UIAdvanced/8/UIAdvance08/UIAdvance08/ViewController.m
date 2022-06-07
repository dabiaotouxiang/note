//
//  ViewController.m
//  UIAdvance08
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *myView;
- (IBAction)changeLineWidth:(id)sender;

@end

- (IBAction)changeLineWidth:(id)sender {
}
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test6];
}

// 让手势同时作用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


-(void) test6{
    // 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.myView addGestureRecognizer:pan];
}

-(void) pan:(UIPanGestureRecognizer *) sender{
    CGPoint p = [sender translationInView:sender.view];
    self.myView.transform = CGAffineTransformTranslate(self.myView.transform, p.x, p.y);
    [sender setTranslation:CGPointZero inView:sender.view];
}

-(void) test5{
    // 捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.myView addGestureRecognizer:pinch];
}

- (void) pinch:(UIPinchGestureRecognizer *)sender{
    NSLog(@"%f", sender.scale);
    self.myView.transform  = CGAffineTransformScale(self.myView.transform, sender.scale, sender.scale);
    sender.scale = 1;
}

-(void) test4{
    // 旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.myView addGestureRecognizer:rotation];
}

-(void) rotation:(UIRotationGestureRecognizer *) sender{
    NSLog(@"旋转了%f", sender.rotation );
    self.myView.transform = CGAffineTransformRotate(self.myView.transform, sender.rotation);
    sender.rotation = 0;
}

-(void) test3{
    // 轻扫
    // 默认左到右
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    // 从右到左
    swipe1.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.myView addGestureRecognizer:swipe];
    [self.myView addGestureRecognizer:swipe1];
}

- (void) swipe:(UISwipeGestureRecognizer *) sender{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"从右向左");
    }else{
        NSLog(@"从左到右");
    }
}

-(void) test2{
    // 长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPress.minimumPressDuration = 3;// 长按多长时间有反应
    longPress.allowableMovement = 100; // 3秒内允许的手指的移动范围
    [self.myView addGestureRecognizer:longPress];
}

-(void)longPress:(UILongPressGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"长按开始");
    }
}

-(void)test1{
    // 敲击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTouchesRequired = 2; // 两根手指
    tap.numberOfTapsRequired = 2; // 点击两次
    [self.myView addGestureRecognizer:tap];
}

-(void) tap: (UITapGestureRecognizer *)sender{
    NSLog(@"点了 ");
}


- (IBAction)changeLineWidth:(id)sender {
}
- (IBAction)changeLineWidth:(id)sender {
}
@end
