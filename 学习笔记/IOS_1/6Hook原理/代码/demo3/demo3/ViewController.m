//
//  ViewController.m
//  demo3
//
//  Created by 大彪 on 2021/9/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)load{
    
    NSLog(@"ViewController + load");
    // 防护method_exchange
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnclick1:(id)sender {
    NSLog(@"按钮1");
}
- (IBAction)btnclick2:(id)sender {
    NSLog(@"按钮2");
}

@end
