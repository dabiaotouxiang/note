//
//  Gun.h
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>
#import "Magazine.h"
#import "Bullet.h"
NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject

{
    NSString *_model;
    int _range;
    Magazine *_magazine;
    Bullet *_bullet;
}

-(void) setModel:(NSString *) model;
-(NSString *) model;

-(void) setRange:(int) range;
-(int) range;

-(void) setMagazine:(Magazine *) magazine;
-(Magazine *) magazine;

-(void) setBullet:(Bullet *) bullet;
-(Bullet *) bullet;

-(BOOL) shot;

@end

NS_ASSUME_NONNULL_END
