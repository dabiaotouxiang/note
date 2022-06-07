//
//  MyView.m
//  GestureToUnlock
//
//  Created by lsb on 2022/5/29.
//

#import "MyView.h"

@interface MyView ()

@property(nonatomic, strong) NSMutableArray *btns;
@property(nonatomic, strong) NSMutableArray *lineBtns;
@property(nonatomic, assign) CGPoint currentPoint;
@property(nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation MyView
- (NSMutableArray *)lineBtns{
    if (!_lineBtns) {
        _lineBtns = [NSMutableArray array];
    }
    return _lineBtns;
}

- (NSMutableArray *)btns{
    if (!_btns){
        _btns = [NSMutableArray array];
        for (int i = 0; i < 9 ; i++){
            UIButton *button = [UIButton new];
    //        [button setBackgroundColor:[UIColor redColor]];
            [button setBackgroundImage:[UIImage imageNamed:@"button_normal"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"button_highlighted"] forState:UIControlStateSelected];
            [button setBackgroundImage:[UIImage imageNamed:@"button_error"] forState:UIControlStateDisabled];
            button.userInteractionEnabled = NO;
            button.tag = i;
            [self addSubview:button];
            [_btns addObject:button];
        }
    }
    return _btns;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = 74;
    CGFloat h = w;
    int colCount = 3;
    CGFloat margin = (self.frame.size.width - 3 * w) / 4;
    for (int i = 0; i< self.btns.count; i++){
        CGFloat x=(i % colCount) * (margin + w) + margin;
        CGFloat y = (i / colCount) * (margin + w) + margin;
        [self.btns[i] setFrame:CGRectMake(x, y, w, h)];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    for (int i = 0; i< self.btns.count; i++){
        UIButton *btn = self.btns[i];
        
        if (CGRectContainsPoint(btn.frame, p)){
            btn.selected = YES;
            [self.lineBtns addObject:btn];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString *password = @"";
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *button = self.lineBtns[i];
        password = [password stringByAppendingFormat:@"%ld", button.tag];
    }
    self.currentPoint = [[self.lineBtns lastObject] center];
    if (self.pwdBlock){
        if(self.pwdBlock(password)){
            NSLog(@"正确");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self clean];
                [self setUserInteractionEnabled:YES];
            });
        }else{
            NSLog(@"错误");
            [self setNeedsDisplay];
            for (int i = 0; i < self.lineBtns.count; i++) {
                UIButton *btn = self.lineBtns[i];
                btn.enabled = NO;
                btn.selected = NO;
            }
            [self setUserInteractionEnabled:NO];
        //    [self clean];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self clean];
                [self setUserInteractionEnabled:YES];
            });
        }
    }
    
    
    
}

-(void) clean{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 将当前的view画到ctx上
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    if ([self.delegate respondsToSelector:@selector(changeImg:)]) {
        [self.delegate changeImg:image];
    }
    for (int i = 0; i< self.btns.count; i++){
        UIButton *btn = self.btns[i];
        btn.selected = NO;
        btn.enabled = YES;
    }
    [self.lineBtns removeAllObjects];
    [self setNeedsDisplay];
    

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = touches.anyObject;
    
    CGPoint p = [t locationInView:t.view];
    self.currentPoint = p;
    for (int i = 0; i< self.btns.count; i++){
        UIButton *btn = self.btns[i];
        
        if (CGRectContainsPoint(btn.frame, p)){
            btn.selected = YES;
            if (![self.lineBtns containsObject:btn]){
                [self.lineBtns addObject:btn];
            }
        }
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (!self.lineBtns.count){
        return;
    }
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *button = self.lineBtns[i];
        if (i == 0){
            [path moveToPoint:button.center];
        }else{
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [[UIColor whiteColor] set];
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
    
    
}


@end
