//
//  main.c
//  work9
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    char ch;
    printf("请输入一个字母:");
    scanf("%c", &ch);
    if (ch <= 90 && ch >= 65){
        printf("输入的是一个大写字母");
    }
    else if (ch <= 122 && ch >= 97){
        printf("输入的是一个小写的字母");
    }
}
