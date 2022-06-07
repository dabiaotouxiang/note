//
//  ViewController.m
//  UIBase01-homework
//
//  Created by lsb on 2022/5/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *qqText;
- (IBAction)imgMoveTop:(id)sender;
- (IBAction)imgMove:(id)sender;
- (IBAction)testMove:(id)sender;
- (IBAction)headerMove:(id)sender;
- (IBAction)imgMove:(id)sender;
- (IBAction)move:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)qqLogin;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)qqLogin {
    NSLog(@"qq是%@, 密码是%@", self.qqText.text, self.passwordText.text);
    [self.view endEditing:YES];
}
- (IBAction)move:(id)sender {
}

- (IBAction)imgMove:(id)sender {
}

- (IBAction)headerMove:(id)sender {
}

- (IBAction)testMove:(id)sender {
}

- (IBAction)imgMove:(id)sender {
}

- (IBAction)imgMoveTop:(id)sender {
}
@end
