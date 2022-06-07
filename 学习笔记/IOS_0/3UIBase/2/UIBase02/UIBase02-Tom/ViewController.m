//
//  ViewController.m
//  UIBase02-Tom
//
//  Created by lsb on 2022/5/15.
//

#import "ViewController.h"

enum PlayTypeEnum{
    PlayTypeEnumKnockout,
    PlayTypeEnumStomach,
    PlayTypeEnumFootLeft,
    PlayTypeEnumFootRight,
    PlayTypeEnumEat,
    PlayTypeEnumPie,
    PlayTypeEnumDrink,
    PlayTypeEnumFart,
    PlayTypeEnumCymbal,
    PlayTypeEnumScratch
};

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgBackGround;
- (IBAction)click:(UIButton *)sender;

- (void)cgPlayWithPath:(NSString *) path andImagCount:(int) count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cgPlayWithPath:@"Animations/Angry/angry_%02d" andImagCount:26];
    // Do any additional setup after loading the view.
}

- (void)cgPlayWithPath:(NSString *) path andImagCount:(int) count{
    if (self.imgBackGround.isAnimating){
        return;
    }
    NSMutableArray *imgList = [NSMutableArray new];
    for (int i = 0; i < count; i++){
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: path, i] ofType:@"jpg"]];
        [imgList addObject:image];
    }
    self.imgBackGround.animationImages = imgList;
    self.imgBackGround.animationDuration = imgList.count * 0.1;
    self.imgBackGround.animationRepeatCount = 1;
    [self.imgBackGround startAnimating];
    
    [self.imgBackGround performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:imgList.count * 0.1];
}

- (IBAction)click:(UIButton *)sender {
    switch (sender.tag) {
        case PlayTypeEnumKnockout:
            [self cgPlayWithPath:@"Animations/Knockout/knockout_%02d" andImagCount:81];
            break;
        case PlayTypeEnumStomach:
            [self cgPlayWithPath:@"Animations/Stomach/stomach_%02d" andImagCount:34];
            break;
        case PlayTypeEnumFootLeft:
            [self cgPlayWithPath:@"Animations/FootLeft/footLeft_%02d" andImagCount:30];
            break;
        case PlayTypeEnumFootRight:
            [self cgPlayWithPath:@"Animations/FootRight/footRight_%02d" andImagCount:30];
            break;
        case PlayTypeEnumEat:
            [self cgPlayWithPath:@"Animations/Eat/eat_%02d" andImagCount:40];
            break;
        case PlayTypeEnumPie:
            [self cgPlayWithPath:@"Animations/Pie/pie_%02d" andImagCount:24];
            break;
        case PlayTypeEnumDrink:
            [self cgPlayWithPath:@"Animations/Drink/drink_%02d" andImagCount:81];
            break;
        case PlayTypeEnumFart:
            [self cgPlayWithPath:@"Animations/Fart/fart_%02d" andImagCount:28];
            break;
        case PlayTypeEnumCymbal:
            [self cgPlayWithPath:@"Animations/Cymbal/cymbal_%02d" andImagCount:13];
            break;
        case PlayTypeEnumScratch:
            [self cgPlayWithPath:@"Animations/Scratch/scratch_%02d" andImagCount:56];
            break;
            
        default:
            break;
    }
    
}
@end
