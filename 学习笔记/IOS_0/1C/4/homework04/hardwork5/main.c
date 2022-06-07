//
//  main.c
//  hardwork5
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int fatherHight, motherHight;
    char sports, eatHealth;
    printf("请输入父母的身高:");
    
    scanf("%d%d", &fatherHight, &motherHight);
    printf("请问是否体育锻炼y or n:");
    rewind(stdin);
    scanf("%c", &sports);
    printf("请问是否饮食健康y or n:");
    rewind(stdin);
    scanf("%c", &eatHealth);
    
    char sex;
    
    printf("请问男f或者女m:");
    rewind(stdin);
    scanf("%c", &sex);
    
    float hight;
    
    if (sex == 'f'){
        hight = (fatherHight + motherHight) * 0.54;
    }else if (sex == 'm'){
        hight = (fatherHight * 0.923 + motherHight) /2;
    } else {
        printf("请正确输入\n");
        return 0;
    }
    
    if (sports == 'y'){
        hight = hight * 1.02;
    }
    if (eatHealth == 'y'){
        hight = hight * 1.015;
    }
    printf("孩子的身高为%f\n", hight);
}
