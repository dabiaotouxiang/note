//
//  Magazine.h
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Magazine : NSObject

{
    int _bulletCount;
}

-(void) setBulletCount:(int) bulletCount;
-(int) bulletCount;

-(BOOL) ejectBullet;

@end

NS_ASSUME_NONNULL_END
