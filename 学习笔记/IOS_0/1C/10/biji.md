# 二维数组
## 语法
```
类型 数组名[行数][列数];
```
## 长度
一般认为是行数*列数
## 下标
数组名\[第几行\]\[第几列\]

## 声明
单单声明二维数组的时候必须指定行数和列数。行数和列数可以是常量，变量，宏，1，0

## 初始化
1. 没有赋值的话，默认是垃圾值
### 全部初始化的几种方式
1. 先声明，再用下标初始化
2. 声明的时候初始化
```
int arr[2][3] = {{1,2,3},{4,5,6}};
```
这时候行数可以省略
3. 省略第二级大括号
```
int arr[2][3] = {1,2,3,4,5,6};
```
行数可以省略，编译器自行判断
### 部分初始化的几种方式
1. `int arr[3][4] = {{10}, {20}, {30}};` 其他的自动初始化为0
2. `int arr[3][4] = {10,20,30};` 从第一行开始赋值，其他的为0
3. `int arr[][4] = {10,20,30,40,50};` 自动计算行数，不够一行的补0
4. `int arr[3][4] = {[1] = {1,2,3,4}, [2]=  {1,2,3,4}};` 给指定的行赋值，其他的补0
5. `int arr[3][4] = {[1][1] = 10};` 给指定的元素赋值

## 在内存中的存储
`int arr[3][4];`从高地址向低地址申请了连续的48个字节的空间，行数从低地址分配到高地址

## 本质
二维数组的本质就是一维数组，是元素都是一维数组的一维数组

## 地址
数组名指向的就是二维数组的地址 == 0行0列的元素的地址 == arr\[0\]的地址

## 函数中的传递
和一维数组一样，会丢失长度，需要传递行数列数。形参和实参的列数必须一致
### 声明
为了让列数不必写死，可以用下面的写法
```
void test(int rows, int cols, int num[][cols]);
```

# 字符数组
字符数组依然不能存中文，初始化部分元素的时候，其他的默认赋值为"\0";

# 字符串
值必须用双引号引起来
## 如何存储字符串
用字符数组进行存储，将每个字符都存入字符数组，并在最后补一个"\0"，代表到这结束

## 存储方式
1. `char name[5] = {'j', 'a', 'c', 'k', '\0'};`
2. `char name[] = {"jack"};` 自动补`'\0'`
3. `char name[] = "jack";`

## 注意
1. 使用字符数组存储字符串的时候，没有指定长度的话，那么长度就是字符数据的长度+1
2. 如果指定了字符数组的长度，那么就是指定的长度
3. 如果指定的长度 <= 字符数据的长度，就会存不下，就不是字符串了，没有`'\0'`，如果给的长度大于字符数据的长度，那么剩下的不管有几位，都补0
4. 存储的时候，最好别给长度，编译器自动确定
5. 如果声明的同时初始化，可以赋值中文。因为一个中文占三个字节，所以没办法直接用下标赋值

## 输出
使用`%s`

## 接收用户输入
### scanf接收
```
char name[10];
scanf("%s", name);
```
1. 如果存不下就会报错
2. 空格会被认为输入结束

## 长度计算
不能用sizeof，因为不知道'\0'有多少个，需要用循环之类的一个一个的去数，到'\0'结束

## 字符串有关的函数
### stdio.h
#### puts()
`puts(name);`
用于输出字符串，自动换行，但是只能输出字符串，也不能用占位符
#### gets()
`gets(name);`
从控制台接收用户的输入数据，优点会接收空格，缺点，不安全，一旦用户输入的超了指定的长度，就会挂掉

### string.h
#### strlen()
`strlen(name);`得到字符串的长度
#### strcmp()
`strcmp(name1, name2);`比较两个字符串的大小。返回值是按位进行字符的ASCII码的相减，如果两个字符串一摸一样，结果为0，如果不是，那就一直减到得到不为0的位，并输出结果
#### strcopy()
`strcopy(name1, name2);` 把name2的拷贝给name1，name1存不下程序就会崩溃
#### strcat()
`strcat(str1,str2);`把str2拼接到str1后面，str1存不下也会崩溃

# stdlib.h
## 控制台清屏函数
`system("clear")`