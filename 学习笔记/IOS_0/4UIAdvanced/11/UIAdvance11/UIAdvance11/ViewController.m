//
//  ViewController.m
//  UIAdvance11
//
//  Created by lsb on 2022/5/31.
//

#import "ViewController.h"
#import "WheelView.h"
@interface ViewController () <WheelViewDelegate>
@property (weak, nonatomic)WheelView *wheelView;
@end

@implementation ViewController

- (void)showAlert{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"幸运号码" message:@"幸运号码是1234" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.wheelView removeFromSuperview];
        WheelView *view = [WheelView loadFromNib];
        view.center = self.view.center;
        view.delegate = self;
        self.wheelView = view;
        [self.view addSubview:view];
    }];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"LuckyBackground"].CGImage;
    
    WheelView *view = [WheelView loadFromNib];
    view.center = self.view.center;
    view.delegate = self;
    self.wheelView = view;
    [self.view addSubview:view];
}


@end
