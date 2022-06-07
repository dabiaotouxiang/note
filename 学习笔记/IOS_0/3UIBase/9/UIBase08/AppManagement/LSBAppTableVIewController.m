//
//  LSBAppTableVIewController.m
//  AppManagement
//
//  Created by lsb on 2022/5/24.
//

#import "LSBAppTableVIewController.h"
#import "LSBAppCell.h"
@interface LSBAppTableVIewController () <LSBAppCellDelegate>

@property(nonatomic, strong) NSArray *apps;

@end

@implementation LSBAppTableVIewController

- (void)showLabel{
    UILabel *label = [UILabel new];
    label.text = @"下载中...";
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor redColor];
    
    label.alpha = 0;
    CGRect screenFrame =[UIScreen mainScreen].bounds;
    label.textAlignment = UITextAlignmentCenter;
    label.frame = CGRectMake((screenFrame.size.width - 200) / 2,  (screenFrame.size.height - 40) / 2, 200, 40);
    [[[UIApplication sharedApplication] keyWindow] addSubview:label];
    
    [UIView animateWithDuration:1 animations:^{
        label.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished){
            [UIView animateWithDuration:1 animations:^{
                label.alpha = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }
    }];
}

- (NSArray *)apps{
    if (_apps == nil){
        _apps = [LSBAppModel appModelsFromFile];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 65;
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
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSBAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appId" forIndexPath:indexPath];
    cell.delegate = self;
    cell.appModel = self.apps[indexPath.row];
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
