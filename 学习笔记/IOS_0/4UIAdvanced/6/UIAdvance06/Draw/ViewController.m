//
//  ViewController.m
//  Draw
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"
#import "MyImageView.h"
@interface ViewController ()
@property(nonatomic, weak) MyImageView *myImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyImageView *imgView = [[MyImageView alloc] initWithImage:[UIImage imageNamed:@"My"]];
    imgView.frame = self.view.frame;
    [self.view addSubview:imgView];
    self.myImageView = imgView;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.myImageView.image =[UIImage imageNamed:@"bg"];
}


@end
