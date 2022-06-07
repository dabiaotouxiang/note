# switch-case
switch-case 选择结构
## switch-case 语法
```
switch-case(表达式)
{
    case 值1:
        执行代码;
        break;
    ...
    default:
        执行代码;
        break;
}
```
## switch-case 注意
1. switch-case 中的小括号可以写表达式，变量，常量
2. case 穿透 每个case中的break在语法上是可以不写的，break代表可以结束整个switch-case。如果没有break，后面的case不会判断。直接执行后面的所有的代码块，直到遇到break或者是全部执行完，所以一般每个case都有break
3. switch后面的表达式的结果除了不能是小数，其他的都可以
4. switch的代码块加大括号也可以
5. 如果case中的代码块有声明的变量，必须加大括号
6. default可以没有
7. case后面的不能有变量

## switch-case与if
1. 能用switch-case的都能用if。if可以写出的，不一定能用switch-case
2. switch-case只能做等值判断

# while循环
```
while (条件表达式)
{
    循环体;
}
```
while后面可以加任意表达式
# break
与python一样
# continue
与python一样