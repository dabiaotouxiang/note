//
//  MyImageView.m
//  Draw
//
//  Created by lsb on 2022/5/29.
//

#import "MyImageView.h"

@implementation MyImageView


- (instancetype) initWithImage:(UIImage *) image{
    self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if (self){
        self.image = image;
    }
    return self;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.image drawInRect:rect];
}


@end
