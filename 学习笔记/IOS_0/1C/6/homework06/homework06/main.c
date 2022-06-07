//
//  main.c
//  homework06
//
//  Created by lsb on 2021/12/23.
//

#include <stdio.h>

// 1
//int main(int argc, const char * argv[]) {
//    // insert code here...
//    int i = 2;
//    for (;;i++){
//        if ((i % 2 == 1) && (i%3 == 1) && (i %4 == 1)){
//            printf("至少%d个\n", i);
//            break;
//        }
//    }
//    return 0;
//}
//2
//int main(int argc, const char * argv[]) {
//    // insert code here...
//    int sum = 0;
//    for (int i = 1; i <= 100;i++){
//        if ((i&1)== 1){
//            sum = sum + i;
//        }
//    }
//    printf("奇数之和为%d\n", sum);
//    return 0;
//}
//3
//#include <stdlib.h>
//int main()
//{
//    int num = 0;
//    for (int i = 0; i < 10 ; i++){
//        int random = arc4random_uniform(198) +3;
//        if (num < random){
//            num = random;
//        }
//    }
//    printf("最大值是：%d\n", num);
//}
//4
//int main(){
//    float money = 10000.0f;
//    for (int i = 0 ; i< 5; i++){
//        money = money * 1.003f;
//    }
//    printf("获得的为:%f\n", money);
//}
//5
//int main(){
//    int num = 100;
//    for (;num < 200; num++){
//        if ((num %3) == 1 && (num%4) == 2 && (num %5) == 3){
//            printf("%d人\n", num);
//        }
//    }
//}
// 6
//int main(){
//    for(;;){
//        printf("请输入一个数，输入100停止:");
//        int num = 0;
//        scanf("%d", &num);
//        if (num == 100){
//            printf("结束\n");
//            break;
//        }
//        printf("%d\n", num * 2);
//    }
//}
// 7
//int main(){
//    int nums = 0;
//    for (int i = 1; i <= 1000 ; i ++){
//        if (i % 7 == 0){
//            nums ++;
//        }
//    }
//    printf("7的倍数有%d个\n", nums);
//}
// 8
//int main(){
//    for (int i = 100; i < 1000 ; i ++){
//        int han = i / 100;
//        int ten = i % 100 / 10;
//        int gewei = i %10;
//        if (i % 7 != 0 && han != 7 && ten != 7 && gewei !=7){
//            printf("%d既不能被7整除也不包含7\n", i);
//        }
//    }
//}
// 9
//int main(){
//    int num = 0;
//    for (int i = 100; i < 1000 ; i ++){
//        int han = i / 100;
//        int ten = i % 100 / 10;
//        int gewei = i %10;
//        if ((han * han * han + ten * ten * ten + gewei * gewei * gewei) == i){
//            printf("%d是水仙花数\n", i);
//            num = num + 1;
//        }
//    }
//    printf("个数为%d\n", num);
//}
// 10
//int main(){
//    int num = 0;
//    printf("请输入一个正整数:");
//    scanf("%d", &num);
//    int sum = 0;
//    for (int i = 1; i <= num ; i ++){
//        sum = sum + i;
//    }
//    printf("总和为%d\n", sum);
//}
// 11
//int main(){
//    for (int i = 1; i <= 9 ; i ++){
//        for (int j = 1; j <= i ; j++){
//            printf("%dx%d=%d\t", i, j, i * j);
//        }
//        printf("\n");
//    }
//}
// 12
//int main(){
//    int num = 0;
//    for (int i = 0; i < 20; i++){
//        printf("请输入一个成绩:");
//        int score = 0;
//        scanf("%d", &score);
//        if (score < 60){
//            num++;
//        }
//    }
//    printf("不及格人数为:%d\n", num);
//}


// 13
int main(){
    int x = 10, y = 10, i;
    for (i = 0; x > 8; y = ++i){
        printf(" %d\t%d\n", x--, y);
    }
}
