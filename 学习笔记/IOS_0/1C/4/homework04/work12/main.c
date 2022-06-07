//
//  main.c
//  work12
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int year,month;
    printf("请输入年份和月份:");
    scanf("%d%d", &year, &month);
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8  || month == 10  || month == 12){
        printf("31天\n");
    }else if (month == 4 || month == 6  || month == 9 || month == 11){
        printf("30天\n");
    }else if (month == 2){
        if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)){
            printf("29天\n");
        }else{
            printf("28天\n");
        }
    }
}
