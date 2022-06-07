//
//  Player.h
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import <Foundation/Foundation.h>
#import "HandType.h"
#import <stdio.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property NSString *name;
@property int score;

//{
//    @public
//    NSString *_name;
//    int _score;
//}

-(HandType) chooseHandType;

-(instancetype) initWithName:(NSString *) name;

@end

NS_ASSUME_NONNULL_END
