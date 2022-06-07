//
//  Player.m
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]){
        self.name = name;
    }
    return self;
}

- (HandType)chooseHandType{
    NSLog(@"亲爱的玩家【%@】请选择你要出的拳头 1.剪刀  2.石头  3.布", self.name);
    char choice;
    scanf("%c", &choice);
    rewind(stdin);
    while (choice != '1' && choice != '2' && choice != '3'){
        NSLog(@"请重新选择你要出的拳头 1.剪刀  2.石头  3.布");
        scanf("%c", &choice);
        rewind(stdin);
    }
    if (choice == '1'){
        NSLog(@"玩家【%@】出的拳头是剪刀", _name);
        return HandTypeScissors;
    } else if (choice == '2'){
        NSLog(@"玩家【%@】出的拳头是石头", _name);
        return HandTypeStone;
    }else{
        NSLog(@"玩家【%@】出的拳头是布", _name);
        return HandTypeCloth;
    }
}

@end
