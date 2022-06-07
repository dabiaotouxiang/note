//
//  ViewController.m
//  QuartZ2D
//
//  Created by lsb on 2022/5/28.
//

#import "ViewController.h"
#import "QuartzView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet QuartzView *quartzView;

@end

@implementation ViewController
- (IBAction)processChange:(UISlider *)sender {
    self.quartzView.value = sender.value;
    [self.quartzView setNeedsDisplay];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
