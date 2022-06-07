//
//  Circle.h
//  homework2
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"
NS_ASSUME_NONNULL_BEGIN

@interface Circle : NSObject

{
    Point2D *_point;
    double _radius;
}

-(void) setPoint2D:(Point2D *) point;
-(Point2D *) point;

-(void) setRadius:(double) radius;
-(double) radius;

-(double) calculateTheArea;

-(double) calculateThePerimeter;

@end

NS_ASSUME_NONNULL_END
