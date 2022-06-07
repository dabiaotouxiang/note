//
//  LottertNavigationController.m
//  Lottery
//
//  Created by lsb on 2022/6/1.
//

#import "LottertNavigationController.h"

@interface LottertNavigationController ()

@end

@implementation LottertNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image =[UIImage imageNamed:@"NavBar64"];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundImage = image;
        [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
        self.navigationBar.standardAppearance  = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
    }else{
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    }
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
