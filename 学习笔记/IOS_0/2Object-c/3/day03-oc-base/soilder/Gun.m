//
//  Gun.m
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import "Gun.h"

@implementation Gun

-(void) setModel:(NSString *) model{
    _model = model;
}
-(NSString *) model{
    return _model;
}

-(void) setRange:(int) range{
    _range = range;
}
-(int) range{
    return _range;
}

-(void) setMagazine:(Magazine *) magazine{
    _magazine = magazine;
}
-(Magazine *) magazine{
    return _magazine;
}

-(void) setBullet:(Bullet *) bullet{
    _bullet = bullet;
}
-(Bullet *) bullet{
    return _bullet;
}

-(BOOL) shot{
    NSLog(@"扣动扳机");
    [_bullet fired];
    BOOL result = [_magazine ejectBullet];
    if (result){
        return YES;
    }else{
        return NO;
    }
}

@end
