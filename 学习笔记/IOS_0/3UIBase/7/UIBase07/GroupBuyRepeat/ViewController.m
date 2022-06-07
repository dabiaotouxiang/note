//
//  ViewController.m
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "ViewController.h"
#import "GBTableViewCell.h"
#import "TableFooter.h"
#import "TableHeader.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, TableFooterDelegate>

@property (strong, nonatomic) NSMutableArray *gBCellModels;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)loadMore{
    [self.gBCellModels addObject:[GBCellModel gBCellModelWithDict:@{@"title": @"你好", @"price": @"0", @"icon": @"ad_00", @"buyCount": @"10"}]];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.gBCellModels.count - 1 inSection:0];
    // 插入指定位置的row，前提是cellModels里面有
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // 使row再滚动光标的顶部
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSMutableArray *)gBCellModels{
    if (_gBCellModels == nil) {
        _gBCellModels = [GBCellModel gBCellModelsFromFile];
    }
    return _gBCellModels;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TableFooter *footer =[TableFooter tableFooterFromFile];
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
    
    self.tableView.tableHeaderView = [TableHeader tableHeaderFromFile];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.gBCellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"gBCell";
    
    GBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [GBTableViewCell gBTableViewCellFromFile];
    }
    cell.cellModel = self.gBCellModels[indexPath.row];
    return cell;
}

@end
