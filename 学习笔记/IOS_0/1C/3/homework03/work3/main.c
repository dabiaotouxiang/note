//
//  main.c
//  work3
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main()
{
    float f1 = 0.0f;
    float f2 = 0.0f;
    printf("请输入两个小数，并用空格隔开:");
    scanf("%f%f", &f1, &f2);
    printf("输入的两个小数为%.2f和%.2f\n", f1, f2);
    return 0;
}
