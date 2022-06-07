//
//  Baby.h
//  day08-ocbase
//
//  Created by lsb on 2022/5/9.
//

#import <Foundation/Foundation.h>
#import "BabySiterProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Baby : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) int age;
@property(nonatomic, strong) id<BabySiterProtocol> babySiter;

-(void) cry;
-(void) feedMilk;
-(void) sleep;
-(void) wantSleep;

@end

NS_ASSUME_NONNULL_END
