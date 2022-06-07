1. 异常处理
    1. 目的: 为了防止程序执行的时候如果发生了异常，不崩溃，而是继续运行
    2. 语法：
        ```
        @try
        {}
        @catch(NSException *ex)
        {}
        // finally 可以省略
        @finally
        {}
        ```
    3. @catch的参数`NSException *ex` 通过%@打印ex指向的对象的值，可以拿到发生异常的原因
    4. `@try ... @catch ...`无法处理C中的异常，有些OC的运行时异常也无法处理，比如
        ```
        Person *p1 = nil;
        p1->_name = @"jack";
        ```
    5. 检查对象是否有某方法
        ```
        [p1 respondsToSelector:@selector(sayHi)]
        ```
2. 类方法
    1. 对象/实例方法，想调用，要先创建对象，通过对象名调用
    2. 类方法，直接通过类名调用。
    3. 声明:
        1. 对象方法: `-(void) test;`
        2. 类方法: `+(void) sayHi;`
    4. 实现
        ```
        +(void) sayHi{}
        ```
    5. 调用，必须用类名调用
        ```
        [类名 类方法名];
        ```
    6. 类方法和对象方法的调用过程:
        1. 类方法节约空间，因为不需要对象
        2. 提高效率，直接在代码段中找到类
    7. 在类方法中不能直接访问属性，因为属性只有在对象创建的时候才会创建在对象中，可以在类方法中创建对象，并访问对象的属性。
    8. 类方法不能访问其他对象方法
    9. 对象方法中可以调用类方法。`[类名 方法名]`
    10. 如果一个方法，不用访问属性和其他对象方法，就可以定义为类方法。
    11. 规范
        1. 写一个方法，要求提供一个和类名相同的类方法（首字母小写），返回一个属性全为默认值的实例
        2. 如果想根据调用者传入的数值，给属性赋值，可以写带参数的类方法

3. NSString
    1. NSString 是Foundation中的一个类
        1. 作用：存储OC字符串，所以OC字符串是本质上是一个对象
    2. 创建字符串
        ```
        NSString *str1 = [NSString new];
        NSString *str2 = [Nsstring string];
        NSString *str3 = [NSString stringWithFormat:@"jack"];
        NSString *str4 = @"jack"
        ```
    3. 打印时 %p 打印的是指针变量的值 %@打印的是指针变量指向的对象
    4. NSString常用的类方法
        1. `+(instancetype) stringWithUTF8(const char*) rullTerminateCString` instancetype 作为返回值，代表返回的是当前这个类的对象
        2. `+(instancetype) stringWithFormat(NSString *) format ...` 作用，拼接一个字符串对象，使用变量或者其他数据组合成一个新的字符串
    5. 常用的对象方法
        1. `NSString *str = @"hello"; NSUInteger len = [str length];` NSUInteger 是 unsigned long 可以处理中文
        2. 得到指定下标的字符` unichar ch = [str characterAtIndex:2];` unichar是unsigned short 可以处理中文。两个字节，OC的中文是两个字节 。输出unichar 用 `%C`
        3. 判断两个字符的内容是否相等。用`==`有时候不靠谱，用`[str isEqualToString: str2]` 返回BOOL值
        4. 比较字符串的大小。`NSComparisonResult re = [str1 compare: str2]` 返回值是一个枚举，可以用int接收，从第一个字符的编码开始比较，一直到得出结果为止
            1. -1 str1 < str2
            2. 0  str1 = str2
            3. 1  str1 > str2
4. 匿名对象
    1. `Person *p1 = [Person new];` 一个指针指向一个对象，p1叫做这个对象的名字
    2. 匿名对象，没有名字的对象，没有指针指向它 `[Person new];`
    3. 如何使用。`[[Person new] sayHi];`
    4. 注意。只能使用一次，而且每次生成的是不同的对象
5. 属性的封装
    1. 面向对象的三大特征： 封装，继承，多态
    2. 属性存在的问题，对象的属性赋值的时候，语法上只要数据的类型是属性的类型就可以，但是情理上有时会有不和，比如年龄是0-180，不希望有别的值
    3. setter方法
        1. 将属性的Public去掉，让外界不可以直接访问。
        2. 为类提供一个setter方法，命名注意，为属性去掉下划线。首字母大写，加上set
            ```
            @interface Person: NSObject
            {
                int _age;
            }
            -(void)setAge:(int) age;
            @end
            @implemetation Person
            -(void)setAge:(int) age{
                _age = age;
            }
            @end
            ```
    4. getter方法 方法的名称就是属性去掉下划线，没有参数。
        ```
        -(int) age;
        -(int) age{
            return _age;
        }
        ```
    5. 什么时候给属性添加setter和getter方法
        1. 只要属性要被外界访问，就用setter和getter方法，哪怕在赋值的时候无任何验证
        2. 属性只要在内部访问，就不用
    6. 只读封装和只写封装
        1. 只读封装：只用getter
        2. 只写封装：只用setter
6. 对象与对象之间的关系：组合，依赖，关联，继承
    1. 组合关系: 一个类由其他的类组成
    2. 依赖关系: 一个对象的方法的参数是另一个对象
        1. 耦合度: 修改一个对象对另一个对象的影响程度
        2. 高内聚: 一个对象只做自己相关的事
        3. 单一职责原则: 一个类只做自己的事，别人的事别人做
    3. 关联关系: 1个类作为另一个类的属性，但不是组合关系
