//
//  main.c
//  hardwork3
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int num1, num2;
    printf("请输入两个整数:");
    scanf("%d%d", &num1, &num2);
    if (num1 % num2 ==0){
        printf("yes\n");
    }else{
        printf("no\n");
    }
}
