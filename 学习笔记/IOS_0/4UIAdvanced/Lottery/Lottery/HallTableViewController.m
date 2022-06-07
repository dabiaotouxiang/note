//
//  HallTableViewController.m
//  Lottery
//
//  Created by lsb on 2022/6/1.
//

#import "HallTableViewController.h"

@interface HallTableViewController ()

@property(nonatomic, weak) UIView *activityView;
@property(nonatomic, weak) UIImageView *activityImageView;
@property(nonatomic, weak) UIButton *closeButton;

@end

@implementation HallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *image =[UIImage imageNamed:@"CS50_activity_image"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activityClick)];
    self.navigationItem.leftBarButtonItem = button;
}

-(void)activityClose{
    [UIView animateWithDuration:0.25 animations:^{
            [self.closeButton removeFromSuperview];
            [self.activityImageView removeFromSuperview];
            [self.activityView removeFromSuperview];
    }];
}

-(void)activityClick{
    UIView *view = [[UIView alloc] initWithFrame:lsbScreenBounds];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.6;
    [self.tabBarController.view addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    // 父控件透明，子控件也透明
    [self.tabBarController.view addSubview:imageView];
    
    UIButton *button = [[UIButton alloc] init];
    UIImage *closeImage =[UIImage imageNamed:@"alphaClose"];
    [button setBackgroundImage:closeImage forState:UIControlStateNormal];
    button.frame = CGRectMake(imageView.frame.size.width - closeImage.size.width, 0, closeImage.size.width, closeImage.size.height);
    [button addTarget:self action:@selector(activityClose) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:button];
    
    self.activityView = view;
    self.activityImageView = imageView;
    self.closeButton = button;
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
