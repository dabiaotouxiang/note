//
//  main.c
//  work14
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int shirts, pants;
    printf("请输入裤子和衬衫的数量:");
    scanf("%d%d", &pants, &shirts);
    printf("应该支付%f元\n", shirts * 45.6 + pants * 78.8);
}
