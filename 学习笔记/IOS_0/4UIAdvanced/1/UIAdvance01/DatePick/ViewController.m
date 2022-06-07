//
//  ViewController.m
//  DatePick
//
//  Created by lsb on 2022/5/25.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) UIDatePicker *datePicker;
@end

@implementation ViewController

- (void) cancelBtn{
    [self.view endEditing:YES];
}

-(void) sureBtn{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *str = [formatter stringFromDate:date];
    self.inputField.text= str;
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDatePicker *datePicker = [UIDatePicker new];
    [datePicker setPreferredDatePickerStyle:UIDatePickerStyleWheels];
    [datePicker setLocale: [NSLocale localeWithLocaleIdentifier:@"zh-hans"] ];
    self.datePicker = datePicker;
    self.inputField.inputView = datePicker;
    
    UIToolbar *toolBar = [UIToolbar new];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtn)];
    
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *sure = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureBtn)];
    
    toolBar.items = @[cancel, fixItem, sure];
    toolBar.bounds = CGRectMake(0, 0, 0, 50);
    self.inputField.inputAccessoryView = toolBar;
    // Do any additional setup after loading the view.
}


@end
