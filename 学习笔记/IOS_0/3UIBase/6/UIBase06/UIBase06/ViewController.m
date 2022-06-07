//
//  ViewController.m
//  UIBase06
//
//  Created by lsb on 2022/5/21.
//

#import "ViewController.h"
#import "Hero.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) UITextField *textView;
@property(nonatomic, strong) NSArray *arrayHero;
@end

@implementation ViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"修改英雄名"
                                                                   message:nil
                                   preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        Hero *hero =self.arrayHero[indexPath.row];
        textField.placeholder = hero.name;
        self.textView = textField;
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
       handler:^(UIAlertAction * action) {}];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        Hero *hero =self.arrayHero[indexPath.row];
        hero.name = self.textView.text;
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0){
        return (CGFloat)100;
    }else{
        return (CGFloat)50;
    }
}

- (NSArray *)arrayHero{
    if (_arrayHero == nil){
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"]];
        NSMutableArray *arrayHero = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict){
            [arrayHero addObject:[Hero heroWithDict:dict]];
        }
        _arrayHero = arrayHero;
    }
    return _arrayHero;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayHero.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger rowIndex = indexPath.row;
    
    static NSString *cellId = @"hero_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    Hero *hero = self.arrayHero[rowIndex];
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.rowHeight = 80;
    
    // Do any additional setup after loading the view.
}


@end
