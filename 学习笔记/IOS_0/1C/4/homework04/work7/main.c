//
//  main.c
//  work7
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("请输入您的年龄:");
    int age;
    scanf("%d", &age);
    if (age > 18){
        printf("您可以观看本网站\n");
    }else if (age < 10){
        printf("您不可以观看本网站\n");
    }else{
        printf("您是否愿意继续?y(yes),n(no):");
        char y_n;
        rewind(stdin);
        scanf("%c",&y_n);
        if (y_n == 'y'){
            printf("请继续\n");
        }else{
            printf("停止\n");
        }
    }
    return 0;
}
