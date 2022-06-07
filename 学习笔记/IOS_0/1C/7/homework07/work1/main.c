//
//  main.c
//  work1
//
//  Created by db on 2021/11/30.
//

#include <stdio.h>
int max(int num1, int num2);
int ab(float num1);

int main(int argc, const char * argv[]) {
    // insert code here...
    int res = ab(1.5f);
    printf("%d\n", res);
    return 0;
}

/*
 选择两个数中较大的那一个
 */
int max(int num1, int num2)
{
    if (num1 >= num2)
    {
        return num1;
    }
    else
    {
        return num2;
    }
}

int ab(float num1)
{
    int num2 = num1;
    if ((num1 - num2) >= 0.5) {
        return num2 + 1;
    }
    return num2;
}
