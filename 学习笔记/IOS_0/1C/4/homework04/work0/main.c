//
//  main.c
//  work0
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int score;
    printf("请输入成绩:");
    scanf("%d", &score);
    if (score >= 90 && score <= 100){
        printf("奖励保时捷汽车\n");
    }else if (score >= 80 && score <= 89){
        printf("奖励奔驰汽车\n");
    }else if (score >= 70 && score <= 79){
        printf("奖励东风日产汽车\n");
    }else if (score >= 60 && score <= 69){
        printf("奖励拖拉机\n");
    }else if (score >= 30 && score <= 59){
        printf("打屁股\n");
    }else if (score >=0 && score < 30){
        printf("断绝父子关系\n");
    }else {
        printf("请输入正确的分数\n");
    }
}
