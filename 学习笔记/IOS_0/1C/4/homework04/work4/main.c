//
//  main.c
//  work4
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    float f;
    printf("请输入一个小数:");
    scanf("%f", &f);
    int int_num = (int)f;
    
    if (f - int_num >= 0.5){
        printf("四舍五入的结果为:%d\n", int_num + 1);
    }else{
        printf("四舍五入的结果为:%d\n", int_num);
    }
}

