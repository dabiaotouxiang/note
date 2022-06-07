//
//  ViewController.m
//  UIBase02
//
//  Created by lsb on 2022/5/15.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *pic;
@property(nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UILabel *imgIndex;
@property (weak, nonatomic) IBOutlet UILabel *imgHeader;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
- (IBAction)btnLeft;
- (IBAction)btnRight;
- (void) imgMove;
@end

@implementation ViewController

-(NSArray *) pic{
    if (_pic == nil){
        _pic = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"]];
    }
    return _pic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = -1;
    [self btnRight];
    // Do any additional setup after loading the view.
}


- (IBAction)btnRight {
    self.index++;
    [self imgMove];
}

-(void)imgMove{
    self.imgIndex.text = [NSString stringWithFormat:@"%d/%lu", self.index + 1, self.pic.count];
    self.imgHeader.text = self.pic[self.index][@"title"];
    UIImage *image = [UIImage imageNamed:self.pic[self.index][@"name"]];
    self.image.image = image;
    self.leftBtn.enabled = self.index != 0;
    self.rightBtn.enabled = (self.index + 1) != self.pic.count;
}

- (IBAction)btnLeft {
    self.index--;
    [self imgMove];
}
@end
