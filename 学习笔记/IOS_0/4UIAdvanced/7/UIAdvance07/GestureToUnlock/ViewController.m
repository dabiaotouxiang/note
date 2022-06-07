//
//  ViewController.m
//  GestureToUnlock
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController () <MyViewDelegate>
@property (weak, nonatomic) IBOutlet MyView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)changeImg:(UIImage *)image{
    self.imgView.image = image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 通过color设置背景的图片
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gesture_back"]]];
    self.myView.pwdBlock = ^BOOL(NSString * myPassword) {
        if ([myPassword isEqualToString:@"1234"]){
            return YES;
        }else{
            return NO;
        }
    };
    self.myView.delegate = self;
}


@end
