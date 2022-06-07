//
//  AppIconDownload.m
//  UIBase03
//
//  Created by lsb on 2022/5/16.
//

#import "AppIconDownload.h"

@interface AppIconDownload ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *labelVIew;
@property (weak, nonatomic) IBOutlet UIButton *btnView;

- (IBAction)btnDownload:(UIButton *)sender;

@end

@implementation AppIconDownload

- (void)setModel:(AppInfo *)model{
    UIImage *image = [UIImage imageNamed:model.name];
    self.imgView.image = image;
    self.labelVIew.text = model.title;
}

+ (instancetype) appIconDownload{
    return [[[NSBundle mainBundle] loadNibNamed:@"AppIconDownload" owner:nil options:nil] firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)btnDownload:(UIButton *)sender {
    self.btnView.enabled = NO;
    
    UILabel *label = [UILabel new];
    
    [self.superview addSubview:label];
    
    label.text = @"正在下载...";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    
    label.backgroundColor = [UIColor blackColor];
    
    label.alpha = 0;
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    CGRect frame = CGRectMake(87, 313, 200, 40);
    label.frame = frame;
    
    [UIView animateWithDuration:1.5 animations:^{
        label.alpha = 0.6;
    } completion:^(BOOL finished){
        if (finished){
            [UIView animateWithDuration:1.5 animations:^{
                label.alpha = 0;
            } completion:^(BOOL finished){
                if (finished){
                    [label removeFromSuperview];
                }
            }];
        }
    }];
    
}
@end
