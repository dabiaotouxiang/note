//
//  main.c
//  work1
//
//  Created by lsb on 2021/12/23.
//

#include <stdio.h>
#include <stdlib.h>

//int main(int argc, const char * argv[]) {
//    // insert code here...
//    int bonus = arc4random_uniform(100) + 1;
//    int times = 0;
//    while (1) {
//        printf("请输入猜测的金额:");
//        int caice;
//        scanf("%d", &caice);
//        if (caice < bonus) {
//            printf("低了\n");
//        }else if (caice > bonus){
//            printf("高了\n");
//        }else{
//            printf("你获得了奖金%d\n", bonus/times);
//            break;
//        }
//        times = times + 1;
//    }
//    return 0;
//}

//int main(){
//    int sum = 0;
//    int i = 0;
//    for (i = 0; i < 5 ; i++){
//        printf("请输入一个大于等于0小于等于100正整数:");
//        int num;
//        scanf("%d", &num);
//        if (num > 100 || num < 0){
//            printf("请输入一个大于等于0小于等于100的正整数\n");
//            break;
//        }
//        sum = sum + num;
//    }
//    if (i == 5) {
//        printf("平均年龄为%d\n", sum/5);
//    }
//}


//int main(){
//    int name =0, password=0;
//    while (name != 123456 && password!=888888){
//        printf("请输入用户名和密码:");
//        scanf("%d%d", &name, &password);
//    }
//    printf("登录成功\n");
//}

//int main(){
//    int sum = 0;
//    for (int i = 1; i <= 100; i++){
//        if (i % 7 !=0){
//            sum = sum + i;
//        }
//    }
//    printf("1-100不能被7整除的数的和为%d\n", sum);
//}

//int main(){
//    int sum = 0;
//    for (int i = 1; i <= 200; i++){
//        sum = sum + i;
//    }
//    printf("1-200的累加和为%d\n", sum);
//}

//int main(){
//    int times = 0;
//    for (int i = 1; i <= 100; i++){
//        if (i % 6 == 0){
//            times = times + 1;
//        }
//    }
//    printf("1-200的累加和为%d\n", times);
//}

//int main(){
//    int num = 0;
//    printf("请输入班级人数:");
//    scanf("%d", &num);
//    int sum = 0;
//    for (int i = 1; i <= num; i++){
//        printf("请输入一个人的成绩:");
//        int score = 0;\
//        scanf("%d", &score);
//        sum = sum + score;
//    }
//    printf("总分为%d\n平均分为%d\n", sum, sum/num);
//}

//int main(){
//    int num = 0;
//    for (int i = 0; i < 10; i++){
//        printf("请输入一个数:");
//        int num1 = 0;
//        scanf("%d", &num1);
//        if (num1 > num){
//            num = num1;
//        }
//    }
//    printf("最大数为%d\n", num);
//}
//int main(){
//    int nums = 0;
//    for (int i = 1000; i < 5000; i++){
//        int th = i / 1000;
//        int han = i % 1000 /100;
//        int ten = i % 100/ 10;
//        int gewei = i % 10;
//        if ((th + han + ten + gewei) == 5){
//            nums++;
//        }
//    }
//    printf("有%d个\n", nums);
//}
int main(){
    int nums = 0;
    for (int i = 0; i < 1000; i++){
        if ((i&1) == 1){
            nums = nums + i;
        }
    }
    printf("基数之和为%d\n", nums);
}
