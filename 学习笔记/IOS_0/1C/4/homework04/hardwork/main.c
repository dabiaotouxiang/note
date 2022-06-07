//
//  main.c
//  hardwork
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    float longth, width, height, weight;
    printf("请输入长宽高和重量:");
    scanf("%f%f%f%f", &longth, &width, &height, &weight);
    if (weight > 30 || longth > 1 || width > 1 || height > 1) {
        printf("不能邮寄\n");
    }else{
        if (weight <= 10){
            printf("缴费%f元\n", 15 * weight);
        }else if (weight <= 20 && weight >10){
            printf("缴费%f元\n", 10 * weight);
        }else if (weight <= 30 && weight >20){
            printf("缴费%f元\n", 8 * weight);
        }
    }
}
