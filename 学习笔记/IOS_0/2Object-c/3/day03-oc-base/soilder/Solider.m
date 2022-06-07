//
//  Solider.m
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import "Solider.h"

@implementation Solider

-(void) setName:(NSString *) name{
    _name = name;
}
-(NSString *) name{
    return _name;
}

-(void) setModel:(NSString *) model{
    _model = model;
}
-(NSString *) model{
    return _model;
}

-(void) setMagazineCount:(int) magazineCount{
    _magazineCount = magazineCount;
}
-(int) magazine{
    return _magazineCount;
}

-(void) setGun:(Gun *) gun{
    _gun = gun;
}
-(Gun *) gun{
    return _gun;
}

-(BOOL) shot{
    NSLog(@"士兵开火");
    BOOL result = [_gun shot];
    if (!result){
        BOOL result = [self reloadMagazine];
        if(result){
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
}

-(BOOL) reloadMagazine{
    if (_magazineCount > 0){
        NSLog(@"换弹匣");
        Magazine *magazine = [Magazine new];
        [magazine setBulletCount:30];
        [_gun setMagazine:magazine];
        _magazineCount -= 1;
        return YES;
    }else{
        NSLog(@"没有子弹了");
        return NO;
    }
}

@end
