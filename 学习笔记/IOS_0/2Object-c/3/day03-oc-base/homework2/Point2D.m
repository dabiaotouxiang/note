//
//  Point2D.m
//  homework2
//
//  Created by lsb on 2022/5/2.
//
#import <math.h>
#import "Point2D.h"

@implementation Point2D

-(void) setX:(double) x{
    _x = x;
}
-(double) x{
    return _x;
}

-(void) setY:(double) y{
    _y = y;
}
-(double) y{
    return _y;
}

-(void) setX:(double) x andY:(double) y{
    _x = x;
    _y = y;
}

-(double) calculateDistance:(Point2D *) point{
    return sqrt(pow(([point x] - _x), 2) + pow(([point y] - _y), 2))
}

+(double) calculateDistanceWithP1:(Point2D *) p1 andP2:(Point2D *) p2{
    return sqrt(pow(([p1 x] - [p2 x]), 2) + pow(([p1 y] - [p2 y]), 2))
}

@end
