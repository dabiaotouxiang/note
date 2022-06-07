//
//  main.c
//  work2
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main()
{
    double d1 = 0.0;
    double d2 = 0.0;
    printf("请输入两个小数，并用空格隔开:");
    scanf("%lf%lf", &d1, &d2);
    printf("输入的数字为%lf和%lf\n", d1, d2);
    printf("输入的数字为%.2lf和%.2lf\n", d1, d2);
    return 0;
}
