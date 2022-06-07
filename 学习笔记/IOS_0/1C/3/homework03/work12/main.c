//
//  main.c
//  work12
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int second = 0;
    printf("请输入秒数:");
    scanf("%d", &second);
    printf("%d天%d小时%d分钟%d秒", second / (3600 * 24), second % (3600 * 24) / 3600, second % (3600 * 24) % 3600 / 60, second % (3600 * 24) % 3600 % 60);
    return 0;
}
