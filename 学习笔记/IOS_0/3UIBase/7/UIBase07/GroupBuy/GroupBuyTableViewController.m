//
//  GroupBuyTableViewController.m
//  GroupBuy
//
//  Created by lsb on 2022/5/21.
//

#import "GroupBuyTableViewController.h"
#import "Product.h"
#import "GroupBuyTableViewCell.h"
#import "GroupBuyTableViewHeader.h"
#import "GroupBuyTableViewFooter.h"
@interface GroupBuyTableViewController () <GroupBuyTableViewFooterDelegate>
@property(nonatomic, strong) NSMutableArray *products;
@end

@implementation GroupBuyTableViewController

- (void)addCell:(GroupBuyTableViewFooter *) footView{
    NSDictionary * dict = @{@"title":@"小尾羊火锅",@"icon":@"ad_00",@"price":@"230",@"buyCount":@"213"};
    [self.products addObject:[Product productWithDict:dict]];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.products.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    [footView endLoad];
}

- (NSMutableArray *)products{
    if (_products == nil){
        _products = [Product loadFromFile];
    }
    return _products;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = [GroupBuyTableViewHeader loadNib];
    GroupBuyTableViewFooter *footerView =[GroupBuyTableViewFooter loadNib];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"productId";
    GroupBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [GroupBuyTableViewCell loadNib];
    }
    
    Product *pro = self.products[indexPath.row];
    cell.model = pro;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
