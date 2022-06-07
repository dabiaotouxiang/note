//
//  Bullet.h
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bullet : NSObject

{
    NSString *_model;
    float _calibre;
}

-(void) setModel:(NSString *) model;
-(NSString *) model;

-(void) setCalibre:(float) calibre;
-(float) calibre;

-(void) fired;
@end

NS_ASSUME_NONNULL_END
