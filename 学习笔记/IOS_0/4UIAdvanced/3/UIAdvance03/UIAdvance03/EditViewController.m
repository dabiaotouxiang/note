//
//  EditViewController.m
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLbl;
@property (weak, nonatomic) IBOutlet UITextField *numberLbl;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)changeStatus:(UIBarButtonItem *)sender;
- (IBAction)save;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLbl.text = self.contact.name;
    self.numberLbl.text = self.contact.number;
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

- (IBAction)save {
    
    if (!([self.nameLbl.text isEqualToString:self.contact.name] && [self.numberLbl.text isEqualToString:self.contact.number])){
        self.contact.name = self.nameLbl.text;
        self.contact.number = self.numberLbl.text;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)changeStatus:(UIBarButtonItem *)sender {
    if (self.saveBtn.hidden) {
        self.saveBtn.hidden = NO;
        sender.title = @"取消";
        self.nameLbl.enabled = YES;
        self.numberLbl.enabled = YES;
    }else{
        sender.title = @"编辑";
        self.saveBtn.hidden = YES;
        self.nameLbl.enabled = NO;
        self.numberLbl.enabled = NO;
    }
}
@end
