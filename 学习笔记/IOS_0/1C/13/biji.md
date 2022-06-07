# 指针
## 指针作为函数的返回值
1. 不能返回函数内部局部变量的地址，因为函数一执行完毕，函数内部的变量的地址就被回收了
```
// 比如下面这个，就不行
int* test()
{
    int arr[] = {10, 20, 30, 40};
    return arr;
}
```

2. 如果想保证不被回收的话，可以在堆中申请，用完要free
```
int* test()
{   
    int *p1 = realloc(4, sizeof(int));
    *p1 = 10;
    *(p1 + 1) = 20; // p1[1] = 20;
    *(p1 + 2) = 30;
    *(p1 + 3) = 40;
    return p1;
}
int main()
{
    int* p1 = test();
    free(p1);
}
```
3. 也可以用全局的，不过不建议，全局的要程序结束才会释放
4. 对于局部变量，可以返回变量值，不能返回变量地址

## 指向函数的指针
### 声明语法
`返回值类型 (*指针名)([参数列表]);`

比如`void (*pFunction)();` 指向返回值为void，没有参数的函数

### 初始化
```
void test(void){
    printf("vvv");
}
pFunction = test;
或者是 void (*pFunction)()=test;
```
### 调用
```
pFunction();
(*pFunction)(); // 由于优先级问题，所以*pFunction 要括起来
```

# 结构体
```
struct 新类型名称
{
    数据类型 名称;
};
```
## 举例
```
struct Student{
    char *name;
    int age;
    int score;
    float height; // 里面的叫成员
};
```

进行结构体变量的声明`struct Student stu;`

## 进行结构体变量的初始化
0. 没有初始化的时候默认是垃圾值
1. 每个变量都要初始化
```
stu.name = "jack";
stu.age = 100;
...
...
```
2. 直接声明的时候全部初始化
```
struct Student xiaoHua = {"小花", 17, 89}; // 按顺序
struct Student liLei = {"李雷"}; // 初始化部分成员 其他初始化为0
```
3. 指定成员初始化
```
struct Student Jim = {.name="吉姆", .age=17, .score=100};
```

## 作用域
和变量相同，一般定义在外面，让所有的函数都可以用

## 赋值
相同类型的结构体变量之间可以互相赋值，原理是值传递，字符串是地址传递

## 结构体数组
```
struct Student stu[5];
```
### 初始化
1. 先声明，然后用下标一个一个的赋值
```
struct Student stu[5];
struct Student s1 = {};
stu[0] = s1;
或者 stu[0] = (struct Student){...};
```
2. 声明的同时赋值
```
struct Student students[5] = {
    {...}, {...}
};
```
### 结构体数组的长度计算
```
sizeof(结构体数组名)/sizeof(结构体名)
```

## 结构体指针
```
struct Student xiaoMing = {"小明", 18, 100};
struct Student *pStu;
pStu = &xiaoMing; 只能指向struct Student类型
struct Student *pStu = &xiaoMing;
```
### 结构体指针的使用
```
1. (*pStu).name;//因为.的优先级高，所以前面的先括起来
2. pStu->name; //常用
```

## 结构体嵌套
```
struct Date
{
    int year;
    int month;
    int day;
};
struct Person
{
    char *name;
    int age;
    double money;
    struct Date birth;
};
struct Person xiaoMing = {"小明", 18, 18, {2000, 1, }};
xiaoMing.birth.day;
```

## 结构体当作函数的参数
```
void test(struct Student stu){

}
```
在内存中是值传递，想传递原始结构体变量就用指针

## 结构体做函数的返回值
值传递。想传递原始的数据就在堆中申请

## 注意
1. `struct Student xxx, xxx;` 可以批量声明
2. 结构体的首字母大写
3. 可以在声明结构体的同时声明结构体变量
    ```
    struct Computer
    {
        char *cpuModel;
        int memSize;
        char *brand;
    }iMac, dell, hp;
    struct Computer acer;
    ```
4. 匿名结构体:
    ```
    struct 
    {
        char *brand;
        int price;
    } fengShan1; // 只能声明的同时创建变量
    ```


# 枚举
```
enum 新类型名称
{
    限定值1,
    限定值2,
    限定值3,
    限定值4
}
```
## 举例
```
anum Direction
{
    East,
    South,
    West,
    North
}
enum Direction dir;
dir = East;
```

## 含义
每个枚举值都代表一个int类型的数，默认情况下是从0开始，但是不建议赋值的时候用0,1,2,3....不方便阅读

```
enum Direction
{
    East = 10; // 指定其代表的int类型的值为10
    South = 20;
    ...
}
```

## 命名规范
枚举类型的名称和命名规范，首字母大写，每个单次的首字母大写。

枚举值的命名规范: 以枚举名开头，后面跟枚举值的名 比如 DirectionEast


# typeof 类型定义
为一个已经存在的数据类型取别名
```
typeof 已经存在的数据类型 别名;
// 为结构体取别名
typeof struct Student Student;

typeof struct Student
{
    char *name;
    int age;
    int score;
}Student;

typeof struct
{
    char *name;
    int age;
    int score;
}Student; 最常用

// 为枚举取别名
typeof enum Direction Direction;
typeof enum Direction
{
    DirectionEast;
    DirectionSouth;
    Direction...
} Direction;
// 最常用，类似匿名结构体的写法
typeof enum
{
    DirectionEast;
    ...
} Direction;
```