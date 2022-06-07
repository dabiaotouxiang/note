//
//  main.c
//  hardwork8
//
//  Created by db on 2021/12/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("请输入税前工资:");
    float salary;
    scanf("%f", &salary);
    printf("养老保险, 个人交纳%f, 单位缴纳%f\n", salary * 0.08, salary * 0.2);
    printf("医疗保险, 个人交纳%f, 单位缴纳%f\n", salary * 0.02, salary * 0.07);
    printf("失业保险, 个人交纳%f, 单位缴纳%f\n", salary * 0.001, salary * 0.002);
    printf("工伤保险, 个人交纳%d, 单位缴纳%f\n", 0, salary * 0.004);
    printf("生育保险, 个人交纳%d, 单位缴纳%f\n", 0, salary * 0.0085);
    printf("住房公积金, 个人交纳%f, 单位缴纳%f\n", salary * 0.12, salary * 0.12);
    
    float nashuie;
    nashuie = salary * (1 - 0.08 - 0.02 - 0.001 - 0.12) -3500;
    
    if (nashuie <= 1500) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.03 + 3500, nashuie * 0.03);
    }else if (nashuie > 1500 && nashuie <= 4500) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.1 + 105 + 3500, nashuie * 0.1 - 105);
    }else if (nashuie > 4500 && nashuie <= 9000) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.2 + 555 + 3500, nashuie * 0.2 - 555);
    }else if (nashuie > 9000 && nashuie <= 35000) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.25 + 1005 + 3500, nashuie * 0.25 - 1005);
    }else if (nashuie > 35000 && nashuie <= 55000) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.3 + 2755 + 3500, nashuie * 0.3 - 2755);
    }else if (nashuie > 55000 && nashuie <= 80000) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.35 + 5505 + 3500, nashuie * 0.35 - 5505);
    }else if (nashuie > 80000) {
        printf("应发工资:%f\n, 纳税为%f\n", nashuie - nashuie * 0.45 + 13505 + 3500, nashuie * 0.45 - 13505);
    }
    return 0;
}
