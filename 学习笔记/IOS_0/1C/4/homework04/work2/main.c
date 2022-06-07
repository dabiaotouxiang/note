//
//  main.c
//  work2
//
//  Created by db on 2021/12/23.
//

//#include <stdio.h>
//
//int main(int argc, const char * argv[]) {
//    // insert code here...
//    int num1, num2, num3;
//    printf("请输入三个整数:");
//    scanf("%d%d%d", &num1, &num2, &num3);
//    int tmp;
//    if (num1 < num2){
//        tmp = num2;
//    }
//    else{
//        tmp = num1;
//    }
//    if (tmp < num3){
//        tmp = num3;
//    }
//    printf("最大值为:%d\n", tmp);
//}

// 产生坏蛋
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]){
    int n = arc4random_uniform(11);
    printf("坏蛋个数为%d\n", n);
    if (n >= 5){
        printf("退鸡蛋\n");
    }
    else{
        printf("吃了吧\n");
    }
    
}
