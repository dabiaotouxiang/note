1. OC相对于C语言
    1. OC本质上还是C语言
    2. OC在C的基础上增加了一部分面向对象的语法，将C语言复杂的，繁琐的语法封装的更为简单
    3. 完全兼容C语言
2. OC的源文件的后缀为.m 代表OC的message机制
3. main函数依然是OC的入口和出口
4. #import
    1. 以#开头代表也是一种预处理指令，编译前执行
    2. 作用: #include的增强版
    3. 增强: 无论一个文件import几次，只会包含一次，#include要配合条件编译才能达到这种效果。
    4. 原理，包含文件的时候，会自动判断是否包含过
5. 框架
    1. 是一个功能集合，苹果或者第三方将一些开发常用的功能事先写好，封装在一个集合里
    2. foundation框架。基础输入输出，数据类型 `#import <Foundation/Foundation.h>`
6. @autoreleasepool 代表自动释放池。代码不写在里面也没关系
7. NSLog(@"Hello"); Foundation框架里的
    1. 作用是printf的增强版
    2. 增强:
        1. 自动添加日期时间，项目名，`[进程号:线程号]`之类的debug信息
        2. 自动换行
        3. 输出OC新增的数据类型
        4. 用法和printf差不多
        5. 自动换行。自己加了`\n`之后，NSLog的自动换行失效，自己的起作用，无论自己在什么位置加了几个，都起作用
8. 字符串
    1. C语言的字符串有两种
        1. 字符数组
        2. 字符指针
    2. NSString OC字符串，指针变量
    3. NSString 常量要用 @"" 只能存储OC字符串，不带@的就是C字符串
    4. 声明 `NSString *str;str = @"jack"`, `NSString *str = @"jack";`, 
9. NS前缀`NextStep -> Cocoa -> Foundation框架中代表NextStep来的`
10. @符号，
    1. 把C字符串转换为OC字符串
    2. OC中的大部分关键字都是@开头的
11. 注释和C一样
12. 函数的定义和调用，和C一样


13. OC的编译链接执行
    1. 在.m文件中写入源代码
    2. cc -c xx.m 
        1. 预处理
        2. 检查语法
        3. C编译
    3. 链接 `cc xx.o -framework Foundation`如果程序使用了框架内的函数或者类，要告诉编译器去哪获取框架


14. OC中的数据类型
    1. OC中支持C中的所有数据类型
        1. 基本数据类型 int double float char
        2. 构造数据类型 数组，结构体，枚举
        3. 指针类型
        4. 空类型
        5. typedef 自定义类型
    2. 新增Bool类型
        1. 存储YES或者NO的任意一个
        2. 条件表达式的结果
        3. 本质是 `typedef signed char Bool;` 有符号的字符类型
        4. YES 是 `#define YES ((BOOL)1)`
        5. NO 是 `#define NO ((BOOL)0)`
    3. Boolean
        1. true 或者 false
        2. 本质 `typedef unsigned char Boolean;`
        3. `#define true 1`
        4. `#define false 0`
    4. class 类
    5. id 万能指针
    6. nil  与NULL差不多
    7. SEL 方法选择器
    8. block 代码段

15. OC支持C的所有的运算符，关键字，控制语句，OC新增的关键字大多数以@开头

16. 类和对象
    1. 类的三要素: 类名，共同特征，共同行为
    2. 定义类的语法: 写在源文件中，不在main函数里
        1. 类的声明
            ```
            @interface 类名 : NSObject
            {
                属性
            } 
            方法的声明
            @end
            ```
        2. 类的实现
            ```
            @implementation 类名
            方法的实现
            @end
            ```
    3. 注意
        1. 类一定有声明和实现
        2. 类名为描述的事物的名称，首字母大写
        3. NSObject
        4. 特征变量写进@interface的花括号中，叫做属性，成员变量，字段
        5. 属性下划线开头
    4. 创建对象 `类名 *对象名 = [类名 new];`
17. 使用对象
    1. 访问对象的属性
        1. 默认情况下，不允许外界访问，加@public就可以外界访问了
        2. `p1->_name = @"jack";` 或者是 `(*p1)._name = @"jack";` 本质上是结构体。 **平时尽量用->访问**
18. 方法的声明，实现，调用
    1. 无参方法
        1. 声明
            ```
            @interface Person: NSObject
            -(返回值类型)方法名称;
            -(void)eat;
            @end
            ```
        2. 实现
            ```
            @implementation Person
            -(void)eat{

            }
            @end
            ```
        3. 调用
            ```
            [实例名 方法名];
            ```
    2. 带一个参数的方法的声明语法
        1. 声明
            ```
            @interface Person: NSObject
            -(返回值类型)方法名称:(参数类型 参数名称);
            -(void)eat:(NSString *)foodName;
            @end
            ```
        2. 实现
            ```
            @implementation Person
            -(void)eat:(NSString *)foodName{

            }
            @end
            ```
        3. 调用
            ```
            [实例名 方法名:实参];
            ```
    3. 多个参数的方法
        1. 声明
            ```
            @interface Person: NSObject
            -(返回值类型)方法名称:(参数类型)参数名称 :(参数类型)参数名称 ...;
            -(void)eat:(NSString *)foodName :(NSString *) time;
            @end
            ```
        2. 实现
            ```
            @implementation Person
            -(void)eat:(NSString *)foodName :(NSString*) time{

            }
            @end
            ```
        3. 调用
            ```
            [实例名 方法名:实参 :实参];
            ```
19. 带参数的方法的命名规范
    1. 如果只有一个参数，方法名最好叫 `xxxWith: 或者是 xxxWithXXX`
    2. 如果有多个参数 方法名 `xxxWith:(参数类型)参数名称 and:(参数类型)参数名称 ....` 或者是  `xxxWith:(参数类型)参数名称 andWith:(参数类型)参数名称 ....`或者是  `xxxWithXXX:(参数类型)参数名称 andWithXXX:(参数类型)参数名称 ....`
    3. 以上均为了方便阅读
20. 方法中直接访问类的属性
    ```
    -(void) sayHi{
        NSLog(@"我是%@", _name);
    }
    ```