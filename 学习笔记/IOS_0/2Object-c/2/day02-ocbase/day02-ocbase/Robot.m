//
//  robot.m
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import "Robot.h"

@implementation Robot

- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]){
        self.name = name;
    }
    return self;
}

- (HandType)chooseHandType{
    int choice;
    choice = arc4random_uniform(3) + 1;
    if (choice == 1){
        NSLog(@"机器人【%@】出的拳头是剪刀", self.name);
        return HandTypeScissors;
    } else if (choice == 2){
        NSLog(@"机器人【%@】出的拳头是石头", self.name);
        return HandTypeStone;
    }else{
        NSLog(@"机器人【%@】出的拳头是布", self.name);
        return HandTypeCloth;
    }
}


@end
