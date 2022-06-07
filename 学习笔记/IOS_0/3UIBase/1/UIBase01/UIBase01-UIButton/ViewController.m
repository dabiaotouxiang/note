//
//  ViewController.m
//  UIBase01-UIButton
//
//  Created by lsb on 2022/5/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *header;

- (IBAction)imgSize:(UIButton *)sender;
- (IBAction)imgMove:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"点我啊" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button setTitle:@"点我干啥" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    UIImage *imageNormal = [UIImage imageNamed:@"header"];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    
    UIImage *imageHeightLight = [UIImage imageNamed:@"add"];
    [button setBackgroundImage:imageHeightLight forState:UIControlStateHighlighted];
    
    button.frame = CGRectMake(10, 10, 20, 20);
    
    [button addTarget:self action:@selector(imgSize:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

- (IBAction)imgSize:(UIButton *)sender {
    NSInteger tag = sender.tag;
    CGRect frame = self.header.frame;
    switch (tag) {
        case 0:
            frame.origin.y -= 10;
            break;
        case 1:
            frame.origin.x -= 10;
            break;
        case 2:
            frame.origin.x += 10;
            break;
        case 3:
            frame.origin.y += 10;
            break;
        default:
            break;
    }
    [UIView animateWithDuration:2 animations:^{
        self.header.frame = frame;
    }];
}

- (IBAction)imgMove:(UIButton *)sender {
    NSInteger tag = sender.tag;
    CGRect frame = self.header.frame;
    switch (tag) {
        case 4:
            frame.size.width += 10;
            frame.size.height += 10;
            break;
        case 5:
            frame.size.width -= 10;
            frame.size.height -= 10;
        default:
            break;
    }
    [UIView animateWithDuration:2 animations:^{
        self.header.frame = frame;
    }];
}
@end
