//
//  main.c
//  work8
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int num;
    printf("请输入一个数字：");
    scanf("%d", &num);
    if (num > 0){
        num = num + 100;
    }else if (num < 0){
        num = num + 500;
    }
    else{
        
    }
    printf("%d\n", num);
}
