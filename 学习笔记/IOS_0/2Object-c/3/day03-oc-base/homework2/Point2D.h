//
//  Point2D.h
//  homework2
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Point2D : NSObject

{
    double _x;
    double _y;
}

-(void) setX:(double) x;
-(double) x;

-(void) setY:(double) y;
-(double) y;

-(void) setX:(double) x andY:(double) y;

-(double) calculateDistance:(Point2D *) point;

+(double) calculateDistanceWithP1:(Point2D *) p1 andP2:(Point2D *) p2;

@end

NS_ASSUME_NONNULL_END
