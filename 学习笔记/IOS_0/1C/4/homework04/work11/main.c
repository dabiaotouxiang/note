//
//  main.c
//  work11
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int years;
    printf("请输入年份:");
    scanf("%d", &years);
    if (years % 400 == 0 || (years % 4 == 0 && years % 100 != 0)){
        printf("闰年\n");
    }else{
        printf("不是闰年\n");
    }
}
