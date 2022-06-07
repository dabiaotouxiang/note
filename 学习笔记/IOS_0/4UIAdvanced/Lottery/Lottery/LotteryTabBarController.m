//
//  LotteryTabBarController.m
//  Lottery
//
//  Created by lsb on 2022/6/1.
//

#import "LotteryTabBarController.h"
#import "LotteryTabBar.h"
@interface LotteryTabBarController () <LotteryTabBarDelegate>

@property(nonatomic, weak)LotteryButton *currentButton;

@end

@implementation LotteryTabBarController

-(void)barButtonClick:(LotteryButton *)button{
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
    [self setSelectedViewController:self.viewControllers[button.tag]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建tabbarItem
    UIViewController *v1 = [self loadSubViewControllerWithSbName:@"Hall"];
    
    UIViewController *v2 = [self loadSubViewControllerWithSbName:@"Arena"];
    
    UIViewController *v3 = [self loadSubViewControllerWithSbName:@"Discovery"];
    
    UIViewController *v4 =[self loadSubViewControllerWithSbName:@"History"];
    
    UIViewController *v5 = [self loadSubViewControllerWithSbName:@"MyLottery"];
    
    self.viewControllers = @[v1, v2, v3, v4, v5];
    
    LotteryTabBar *tabBar = [[LotteryTabBar alloc] initWithFrame:self.tabBar.frame andNum:self.viewControllers.count];;
    
    tabBar.delegate = self;
    for (int i = 0; i < self.viewControllers.count ; i ++){
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [tabBar setImageWithIndex:i andImage:[UIImage imageNamed:imageName] andImageSel:[UIImage imageNamed:selImageName]];
    }
    
    [self.view addSubview:tabBar];
    
    [self barButtonClick:tabBar.subviews[0]];
}

- (UIViewController *)loadSubViewControllerWithSbName:(NSString *) name{
    UIStoryboard *board = [UIStoryboard storyboardWithName:name bundle:nil];
    return [board instantiateInitialViewController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
