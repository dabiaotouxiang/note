//
//  main.c
//  work13
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    float pi = 3.14f;
    float hight, radio;
    printf("请输入圆柱体的半径和高");
    scanf("%f%f", &radio, &hight);
    printf("圆柱体的体积为%f\n", pi * radio * radio * hight);
}
