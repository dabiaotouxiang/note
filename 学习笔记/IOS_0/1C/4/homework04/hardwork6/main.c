//
//  main.c
//  hardwork6
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("请按顺序输入语文数学英语三科成绩:");
    int lanScore, mathScore, EngScore;
    scanf("%d%d%d", &lanScore, &mathScore, &EngScore);
    printf("总分为%d\n平均分为%f\n", lanScore + mathScore + EngScore, lanScore + mathScore + EngScore / 3.0);
    return 0;
}
