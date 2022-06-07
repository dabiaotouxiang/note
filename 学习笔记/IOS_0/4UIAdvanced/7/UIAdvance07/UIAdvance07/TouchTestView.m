//
//  TouchTestView.m
//  UIAdvance07
//
//  Created by lsb on 2022/5/29.
//

#import "TouchTestView.h"

@implementation TouchTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    CGPoint point = [touch locationInView:self.superview];
    
    self.center = point;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    CGPoint point = [touch locationInView:self.superview];
    
    self.center = point;
}

@end
