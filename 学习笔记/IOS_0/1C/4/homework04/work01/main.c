//
//  main.c
//  work01
//
//  Created by db on 2021/11/29.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int moneys = 10000, get_money;
    printf("请输入取钱金额:");
    scanf("%d", &get_money);
    if (get_money % 100 != 0) {
        printf("请输入一百的倍数\n");
    } else if (get_money > moneys){
        printf("余额不足\n");
    } else{
        printf("正在出钞\n");
    }
}
