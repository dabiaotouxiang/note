//
//  Judge.m
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import "Judge.h"

@implementation Judge

- (void)judgeHandType{
    Player *jack = [[Player alloc] initWithName:@"jack"];
    jack.score = 0;
    
    Robot *bot = [[Robot alloc] initWithName:@"bot"];
    bot.score = 0;
    
    char choice = 'y';
    while (choice == 'y'){
        HandType playerHandType = [jack chooseHandType];
        HandType robotHandType = [bot chooseHandType];
        
        NSLog(@"我是裁判【%@】,我来宣布比赛结果------", _name);
        int result = playerHandType - robotHandType;
        if (result == 0){
            NSLog(@"【%@】，【%@】你们真是心有灵犀啊！", jack.name, bot.name);
        }else if (result == -2 || result == 1){
            NSLog(@"玩家【%@】获胜！", jack.name);
            jack.score += 1;
        }else {
            NSLog(@"机器人【%@】获胜！", bot.name);
            bot.score += 1;
        }
        NSLog(@"现在比分: 玩家【%@】: %d ----- 机器人【%@】: %d", jack.name, jack.score, bot.name, bot.score);
        NSLog(@"还继续玩吗? y/n");
        scanf("%c", &choice);
        rewind(stdin);
    }
    
}

@end
