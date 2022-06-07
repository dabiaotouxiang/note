//
//  ViewController.m
//  UIBase01
//
//  Created by lsb on 2022/5/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *arg1;
@property (weak, nonatomic) IBOutlet UITextField *arg2;
- (IBAction)imgMove:(id)sender;
- (IBAction)imgSize:(id)sender;
- (IBAction)action;
- (IBAction)headerImgMove:(UIButton *)sender;
- (IBAction)login;
- (IBAction)login:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UILabel *res;
- (IBAction)addition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)addition {
    int arg1 = self.arg1.text.intValue;
    int arg2 = self.arg2.text.intValue;
    int res = arg1 + arg2;
    self.res.text = [NSString stringWithFormat:@"%d", res];
    [self.view endEditing:YES];
}
- (IBAction)login {
}

- (IBAction)login:(id)sender {
}

- (IBAction)login {
}

- (IBAction)action {
}

- (IBAction)login:(id)sender {
}
@end
