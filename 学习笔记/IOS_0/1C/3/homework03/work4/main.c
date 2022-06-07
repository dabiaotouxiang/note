//
//  main.c
//  work4
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main()
{
    int num1 = 0;
    int num2 = 0;
    printf("请输入两个整数:");
    scanf("%d%d", &num1, &num2);
    printf("这两个数的和为:%d\n", num1 + num2);
    printf("这两个数的差为:%d\n", num1 - num2);
    printf("这两个数的商为:%d\n", num1 / num2);
    printf("这两个数的余数为:%d\n", num1 % num2);
    return 0;
}
