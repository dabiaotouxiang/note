//
//  ViewController.m
//  Flag
//
//  Created by lsb on 2022/5/25.
//

#import "ViewController.h"
#import "Flag.h"
#import "FlagView.h"
@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong) NSArray *flags;

@end

@implementation ViewController

#pragma mark - datasource -
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    Flag *flag = self.flags[row];
    FlagView *flagView = [FlagView flagViewFromNib];
    flagView.flag = flag;
    return flagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 100;
}

#pragma mark - delegate -
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}


- (NSArray *)flags{
    if (_flags == nil) {
        _flags = [Flag flagsFromFile];
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
