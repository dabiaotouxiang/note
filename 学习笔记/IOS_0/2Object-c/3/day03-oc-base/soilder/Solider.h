//
//  Solider.h
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
NS_ASSUME_NONNULL_BEGIN

@interface Solider : NSObject

{
    NSString *_name;
    NSString *_model;
    int _magazineCount;
    Gun *_gun;
}

-(void) setName:(NSString *) name;
-(NSString *) name;

-(void) setModel:(NSString *) model;
-(NSString *) model;

-(void) setMagazineCount:(int) magazineCount;
-(int) magazine;

-(void) setGun:(Gun *) gun;
-(Gun *) gun;

-(BOOL) shot;

-(BOOL) reloadMagazine;

@end

NS_ASSUME_NONNULL_END
