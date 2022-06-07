//
//  main.c
//  hardwork4
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int hight, weight;
    printf("请输入身高(厘米)体重(千克):");
    scanf("%d%d", &hight, &weight);
    if (weight == (hight - 110)){
        printf("标准\n");
    }else if(weight > (hight - 110 + 5)){
        printf("过胖\n");
    }else if(weight < (hight - 110 - 5)){
        printf("过瘦\n");
    }
}
