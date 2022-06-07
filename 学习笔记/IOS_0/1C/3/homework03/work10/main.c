//
//  main.c
//  work10
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int r = 0;
    printf("请输入圆的半径:");
    scanf("%d", &r);
    printf("面积为%f,周长为%f", 3.14 * r * r, 2 * 3.14 * r);
    return 0;
}
