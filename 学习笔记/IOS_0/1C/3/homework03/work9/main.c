//
//  main.c
//  work9
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int longth = 0;
    int width = 0;
    printf("请输入长和宽");
    scanf("%d%d", &longth, &width);
    printf("面积为%d,周长为%d\n", longth * width, (longth + width) * 2);
    return 0;
}
