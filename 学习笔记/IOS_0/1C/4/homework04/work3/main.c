//
//  main.c
//  work3
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int a,b;
    printf("请输入两个整形的数:");
    scanf("%d%d", &a, &b);
    if ((a/b) == 0 || (a + b) > 100) {
        printf("%d\n",a);
    }
    else{
        printf("%d\n", b);
    }
}
