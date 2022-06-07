//
//  WheelView.m
//  UIAdvance11
//
//  Created by lsb on 2022/5/31.
//

#import "WheelView.h"

@interface WheelView ()

@property (weak, nonatomic) IBOutlet UIImageView *rotateView;
@property (weak, nonatomic) UIButton *currentButton;
@property (strong, nonatomic) CADisplayLink *link;
@end

@implementation WheelView
- (IBAction)startBtn:(UIButton *)sender {
    self.userInteractionEnabled = NO;
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    CABasicAnimation *anim = [[CABasicAnimation alloc]init];
    anim.keyPath = @"transform.rotation";
    CGFloat angle = 2 * M_PI / 12;
    anim.toValue = @(2 * M_PI * 5 - angle * self.currentButton.tag);
    anim.duration  = 3;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion= NO;
    [self.rotateView.layer addAnimation:anim forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(anim.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.rotateView.transform = CGAffineTransformMakeRotation(-angle * self.currentButton.tag);
        
        if ([self.delegate respondsToSelector:@selector(showAlert)]){
            [self.delegate showAlert];
        }
    });
    
}
+ (instancetype)loadFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"wheel" owner:nil options:nil]firstObject];;
}

-(void) clickBtn:(UIButton *) sender{
    self.currentButton.selected = NO;
    [sender setSelected:YES];
    self.currentButton = sender;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    UIImage *image = [UIImage imageNamed:@"LuckyRototeSelected"];
    UIImage *luckAstrology = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *luckAstrologyPress = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    for (int i = 0; i < 12 ; i ++){
        UIImage *astrology = [self clipImage:luckAstrology withIndex:i];
        UIImage *astrologyPressed = [self clipImage:luckAstrologyPress withIndex:i];
        UIButton *button = [UIButton new];
        button.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
        [button setImage:astrology forState:UIControlStateNormal];
        [button setImage:astrologyPressed forState:UIControlStateSelected];
        [button setBackgroundImage:image forState:UIControlStateSelected];
        button.center = self.rotateView.center;
        button.tag = i;
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.rotateView addSubview:button];
    }
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    self.link = link;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void) rotate{
    CGFloat angle = 2 * M_PI / 16 / 30;
    self.rotateView.transform = CGAffineTransformRotate(self.rotateView.transform, angle);
}

- (UIImage *) clipImage:(UIImage *)sourceImage withIndex:(NSInteger)index{
    CGFloat w = sourceImage.size.width / 12 * [UIScreen mainScreen].scale;
    CGFloat h = sourceImage.size.height * [UIScreen mainScreen].scale;
    CGFloat x = w * index;
    CGFloat y = 0;
    CGImageRef imageRef = CGImageCreateWithImageInRect(sourceImage.CGImage, CGRectMake(x, y, w, h));
    return  [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat angle = 2 * M_PI / 12;
    for (int i = 0; i < self.rotateView.subviews.count ; i++){
        UIButton *button = self.rotateView.subviews[i];
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        button.transform = CGAffineTransformMakeRotation(angle * i);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 50, 0);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
