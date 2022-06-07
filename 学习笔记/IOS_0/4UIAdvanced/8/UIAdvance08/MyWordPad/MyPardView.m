//
//  MyPardView.m
//  MyWordPad
//
//  Created by lsb on 2022/5/30.
//

#import "MyPardView.h"
#import "MyPath.h"
@interface MyPardView ()
@property(nonatomic, strong) NSMutableArray *paths;
@end

@implementation MyPardView

-(void)save{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    UIGraphicsGetImageFromCurrentImageContext();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}

-(void)clear{
    self.paths = nil;
    [self setNeedsDisplay];
}


-(void)back{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

-(void) rubber{
    self.lineColor = self.backgroundColor;
}


- (NSMutableArray *)paths{
    if (_paths ==nil) {
        _paths = [NSMutableArray new];
    }
    return _paths;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (MyPath *path in self.paths){
        [path.color set];
        [path stroke];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint p = [touch locationInView:touch.view];
    MyPath *path = [MyPath new];
    [path moveToPoint:p];
    [path setLineWidth:self.lineWidth];
    path.color = self.lineColor;
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint p = [touch locationInView:touch.view];
    [[self.paths lastObject] addLineToPoint:p];
    [self setNeedsDisplay];
}

@end
