//
//  Bullet.m
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import "Bullet.h"

@implementation Bullet

-(void) setModel:(NSString *) model{
    _model = model;
}
-(NSString *) model{
    return _model;
}

-(void) setCalibre:(float) calibre{
    _calibre = calibre;
}
-(float) calibre{
    return _calibre;
}

-(void) fired{
    NSLog(@"子弹被击发了...");
}

@end
