//
//  LoginViewController.m
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import "LoginViewController.h"
#import "ContactViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountName;
@property (weak, nonatomic) IBOutlet UITextField *accountPwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *remSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;

-(void) textChange;
- (IBAction)loginClick;

- (IBAction)remSwitchChange;
- (IBAction)autoLoginSwitch;

@end

@implementation LoginViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ContactViewController *con = segue.destinationViewController;
    con.title = [NSString stringWithFormat:@"%@的通信录", self.accountName.text];
}

- (IBAction)autoLoginSwitch {
    if (self.autoSwitch.isOn){
        [self.remSwitch setOn:YES animated:YES];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:self.autoSwitch.isOn forKey:@"autoSwitch"];
    [ud setBool:self.remSwitch.isOn forKey:@"remSwitch"];
    [ud synchronize];
}

- (IBAction)remSwitchChange {
    if (!self.remSwitch.isOn) {
        [self.autoSwitch setOn:NO animated:YES];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:self.autoSwitch.isOn forKey:@"autoSwitch"];
    [ud setBool:self.remSwitch.isOn forKey:@"remSwitch"];
    [ud synchronize];
}

- (IBAction)loginClick {
    
    if ([self.accountName.text isEqualToString:@"1"] && [self.accountPwd.text isEqualToString:@"1"]){
        [self performSegueWithIdentifier:@"login2contact" sender:nil];
        if (self.remSwitch.isOn){
            NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
            NSString *filePath = [docPath stringByAppendingPathComponent:@"pwd.plist"];
            NSDictionary *dict = @{
                @"name": self.accountName.text,
                @"pwd": self.accountPwd.text
            };
            [dict writeToFile:filePath atomically:YES];
        }
    }else{
        
    }
}

- (void)textChange{
    self.loginBtn.enabled = self.accountName.text.length > 0 && self.accountPwd.text.length > 0;
}

- (void)viewDidLoad {
    NSLog(@"%@", NSHomeDirectory());
    [super viewDidLoad];
    [self.accountName addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.accountPwd addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL remSwitchBool =[ud boolForKey:@"remSwitch"];
    BOOL autoSwitchBool =[ud boolForKey:@"autoSwitch"];
    [self.remSwitch setOn:remSwitchBool animated:YES];
    [self.autoSwitch setOn:autoSwitchBool animated:YES];
    
    if (self.remSwitch.isOn){
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [docPath stringByAppendingPathComponent:@"pwd.plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        self.accountName.text = dict[@"name"];
        self.accountPwd.text = dict[@"pwd"];
    }
    if (self.autoSwitch.isOn){
        [self loginClick];
    }
    // Do any additional setup after loading the view.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
