//
//  main.c
//  work1
//
//  Created by db on 2021/11/27.
//

#include <stdio.h>
int main()
{
    char ch1 = 'a';
    printf("请输入第一个字符:");
    scanf("%c", &ch1);
    
    rewind(stdin);
    
    char ch2 = 'b';
    printf("请输入第二个字符:");
    scanf("%c", &ch2);
    
    printf("第一个字符:%c,第二个字符:%c\n", ch1, ch2);
}
