//
//  Circle.m
//  homework2
//
//  Created by lsb on 2022/5/2.
//

#import "Circle.h"

@implementation Circle

-(void) setPoint2D:(Point2D *) point{
    _point = point;
}
-(Point2D *) point{
    return _point;
}

-(void) setRadius:(double) radius{
    _radius = radius;
}
-(double) radius{
    return _radius;
}

-(double) calculateTheArea{
    return 3.14 * pow(_radius, 2);
}

-(double) calculateThePerimeter{
    return 2.0 * 3.14 * _radius;
}

@end
