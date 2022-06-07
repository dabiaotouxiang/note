//
//  robot.h
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import <Foundation/Foundation.h>
#import "HandType.h"
#import <stdlib.h>
NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject

@property NSString *name;
@property int score;
-(HandType) chooseHandType;
-(instancetype) initWithName:(NSString *) name;
@end

NS_ASSUME_NONNULL_END
