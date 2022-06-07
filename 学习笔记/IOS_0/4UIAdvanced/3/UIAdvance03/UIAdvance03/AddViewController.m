//
//  AddViewController.m
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLbl;
@property (weak, nonatomic) IBOutlet UITextField *numberLbl;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addClick;

@end

@implementation AddViewController

- (void)textChange{
    self.addBtn.enabled = self.nameLbl.text.length > 0 && self.numberLbl.text.length >0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameLbl addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.numberLbl addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
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

- (IBAction)addClick {
    if ([self.delegate respondsToSelector:@selector(addContactWithController:andName:andNumber:)]){
        [self.delegate addContactWithController:self andName:self.nameLbl.text andNumber:self.numberLbl.text];
    }
}
@end
