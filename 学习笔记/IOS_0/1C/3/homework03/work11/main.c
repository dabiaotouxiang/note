//
//  main.c
//  work11
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int days = 0;
    printf("请输入天数");
    scanf("%d", &days);
    printf("%d周%d天\n", days / 7, days % 7);
    return 0;
}
