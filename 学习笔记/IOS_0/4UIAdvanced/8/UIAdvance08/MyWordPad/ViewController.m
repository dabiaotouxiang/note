//
//  ViewController.m
//  MyWordPad
//
//  Created by lsb on 2022/5/30.
//

#import "ViewController.h"
#import "MyPardView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyPardView *pardView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@end

@implementation ViewController

-(IBAction)clear:(UIBarButtonItem *)sender{
    [self.pardView clear];
}

-(IBAction)rubber:(UIBarButtonItem *)sender{
    [self.pardView rubber];
}

-(IBAction)save:(UIBarButtonItem *)sender{
    [self.pardView save];
}
-(IBAction)back:(UIBarButtonItem *)sender{
    [self.pardView back];
}


-(IBAction)changeColor:(UIButton *)sender{
    self.pardView.lineColor = sender.backgroundColor;
}

- (IBAction)lineChangeWidth:(UISlider *)sender{
    self.pardView.lineWidth = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pardView.lineWidth = self.slider.value;
    [self changeColor:self.firstButton];
}


@end
