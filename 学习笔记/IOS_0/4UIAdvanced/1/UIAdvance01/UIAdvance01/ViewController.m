//
//  ViewController.m
//  UIAdvance01
//
//  Created by lsb on 2022/5/25.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, strong) NSArray *nameLists;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainCourseLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)randomClick;



@end

@implementation ViewController

- (NSArray *)nameLists{
    if(_nameLists == nil){
        _nameLists = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"food" ofType:@"plist"]];
    }
    return _nameLists;
}

#pragma mark - datasource -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.nameLists.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *array = self.nameLists[component];
    return array.count;
}
#pragma mark - delegate -

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSArray *array = self.nameLists[component];
    switch (component) {
        case 0:
            self.fruitLabel.text = array[row];
            break;
        case 1:
            self.mainCourseLabel.text = array[row];
            break;
        case 2:
            self.drinkLabel.text = array[row];
            break;
        default:
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *array = self.nameLists[component];
    return array[row];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fruitLabel.text = self.nameLists[0][0];
    self.mainCourseLabel.text = self.nameLists[1][0];
    self.drinkLabel.text = self.nameLists[2][0];
    
    // Do any additional setup after loading the view.
}


- (IBAction)randomClick {
    NSArray *array =self.nameLists[0];
    NSInteger first =arc4random_uniform((uint32_t)array.count);
    [self.pickerView selectRow:first inComponent:0 animated:YES];
    self.fruitLabel.text = self.nameLists[0][first];
    
    
    array =self.nameLists[1];
    NSInteger second =arc4random_uniform((uint32_t)array.count);
    [self.pickerView selectRow:second inComponent:1 animated:YES];
    self.mainCourseLabel.text = self.nameLists[1][second];
    
    
    array =self.nameLists[2];
    NSInteger third =arc4random_uniform((uint32_t)array.count);
    [self.pickerView selectRow:third inComponent:2 animated:YES];
    self.drinkLabel.text = self.nameLists[2][third];
    
}
@end
