//
//  main.c
//  work10
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("请输入1-7:");
    int num;
    scanf("%d", &num);
    if (num == 1){
        printf("Monday\n");
    }else if (num == 2){
        printf("Tuesday\n");
    }else if (num == 3){
        printf("Wednesday\n");
    }else if (num == 4){
        printf("Thursday\n");
    }else if (num == 5){
        printf("Friday\n");
    }else if (num == 6){
        printf("Saturday\n");
    }else if (num == 7){
        printf("Sunday\n");
    }else{
        printf("你是火星人吗?\n");
    }
}
