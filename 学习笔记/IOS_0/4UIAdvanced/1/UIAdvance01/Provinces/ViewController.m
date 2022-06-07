//
//  ViewController.m
//  Provinces
//
//  Created by lsb on 2022/5/25.
//

#import "ViewController.h"
#import "Province.h"
@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property(nonatomic, strong) NSArray *provinces;

@end

@implementation ViewController

- (NSArray *)provinces{
    if (_provinces == nil) {
        _provinces = [Province provincesFromFile];
    }
    return _provinces;
}

#pragma mark - delegate -

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0){
        Province *province = self.provinces[row];
        [self.pickerView reloadComponent:1];
        return province.name;
    }else{
        NSInteger index = [self.pickerView selectedRowInComponent:0];
        Province *province = self.provinces[index];
        return province.cities[row];
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger index = [self.pickerView selectedRowInComponent:0];
    Province *province = self.provinces[index];
    
    
    if (component == 0){
        self.provinceLabel.text = province.name;
        NSInteger indexCity = [self.pickerView selectedRowInComponent:1];
        self.cityLabel.text = province.cities[indexCity];
    }else{
        index = [self.pickerView selectedRowInComponent:1];
        self.cityLabel.text = province.cities[index];
    }
}

#pragma mark - datasource -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.provinces.count;
    }else{
        NSInteger index = [self.pickerView selectedRowInComponent:0];
        Province *province = self.provinces[index];
        return province.cities.count;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pickerView selectRow:0 inComponent:0 animated:NO];
    [self.pickerView selectRow:0 inComponent:1 animated:NO];
    Province *province = self.provinces[0];
    self.provinceLabel.text = province.name;
    self.cityLabel.text = province.cities[0];
    // Do any additional setup after loading the view.
}


@end
