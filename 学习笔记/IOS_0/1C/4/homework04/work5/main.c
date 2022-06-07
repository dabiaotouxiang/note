//
//  main.c
//  work5
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int user_num;
    printf("请输入密码\n");
    scanf("%d", &user_num);
    if (user_num == 888888){
        printf("密码正确\n");
    }else{
        printf("密码错误。请重新输入:");
        scanf("%d", &user_num);
        if (user_num == 888888){
            printf("密码正确\n");
        }else{
            printf("密码错误\n");
        }
    }
    return 0;
}
