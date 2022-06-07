//
//  Magazine.m
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import "Magazine.h"

@implementation Magazine

-(void) setBulletCount:(int) bulletCount{
    _bulletCount = bulletCount;
}
-(int) bulletCount{
    return _bulletCount;
}

-(BOOL) ejectBullet{
    if (_bulletCount > 0){
        NSLog(@"弹匣弹出子弹到枪中");
        _bulletCount -= 1;
        return YES;
    }else{
        NSLog(@"子弹用光了");
        return NO;
    }
}

@end
