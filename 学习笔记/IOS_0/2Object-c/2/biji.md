1. 内存中的五大区域:
    1. 栈 存储局部变量
    2. 堆 手动malloc，calloc，realloc申请的内存空间
    3. BSS段 存储未初始化的全局变量，静态变量。
    4. 数据段(常量区)已经被初始化的全局，静态变量，常量数据。
    5. 代码段 存代码
2. 类加载
    1. 创建对象的时候访问类
    2. `Person *p1` 声明Person类指针，也访问类
    3. 在程序运行的时候，当类第一次被访问，会把类存储到代码段区域，这个叫类加载，只有第一次访问的时候才会类加载，一旦加载到代码段，程序结束的时候才释放
3. 对象在内存中的存储
    1. `Person *p1 = [Person new];` main函数中
    2. `Person *p1`声明了一个Person类型的指针变量，会在栈中申请一块空间，存储指向的地址
    3. `[Person new];` 真正在内存中创建对象。new做的事
        1. 在堆中申请一块合适大小的空间
        2. 在空间中根据类的模板创建对象，类模板中有什么属性，就在空间中声明什么属性。还有一个isa属性，是一个指针指向代码段中类代码的位置
        3. 初始化对象的属性
            1. 如果属性类型是基础类型，就赋值为0
            2. 如果属性类型是C中的指针类型，就赋值为NULL
            3. 如果属性类型是类指针类型，就赋值为nil(比如NSString之类的)
        4. 返回对象的地址
    4. 注意:
        1. 对象中只有属性，没有方法
        2. 对象的属性，指针名->属性名，根据指针找到对象，在找到对象的属性
        3. 访问方法，根据指针找到对象，根据对象中的isa指针找到类，再从类中找到方法
    5. 为什么不把方法存储在对象中，每个方法实现都一样，只保存一份在类中就行了
4. nil和NULL
    1. NULL 只能作为指针变量的值，代表不指向任何空间，等价于0，就是个宏
    2. nil 同上
    3. 实用建议:
        1. C指针用NULL
        2. OC指针用nil
    4. 类指针为nil的时候，访问属性出错，访问方法不会执行，无反应。
5. 多个指针可以指向同一个对象，同类型的指针可以相互赋值的
6. 分组导航标记
    1. `#pragma mark 分组名` 可以在代码窗上导航栏的位置添加标记
    2. `#pragma mark -` 可以在代码窗上导航栏对应的位置添加一条分割线
    3. `#pragma mark - 分组名` 可以在代码窗上导航栏对应的位置添加一条分割线，在添加分组名
7. 函数和方法的对比
    1. 函数
    ```
    void test(){

    }
    ```
    2. 方法
    ```
    -(void)test{

    }
    ```
    3. 相同点: 都是将一段代码封装在其中，表示一个相对独立的功能
    4. 不同点: 
        1. 语法不同
        2. 定义的位置不同，函数除了函数内部和@interface的大括弧之中，其他的地方都能写，就算函数写在类中，该函数也不属于类，创建的对象也无该函数
        3. 调用方式不同: 函数直接调用，但是方法先创建对象再调用
        4. 方法属于类，函数独立
8. 类可以直邮实现，无声明。但是不建议这么写，不规范
```
@implemetation Student: NSObject
{
    ...
}
@end
```
9. 多文件开发
    1. 一个类一个模块，包含两个文件，`.h文件` 类声明 `.m文件`类的实现
    2. 头文件写类声明，要用到Foundation框架中的类，NSObject，所以这个头文件中引入Foundation框架的头文件。
    3. 实现文件，先引入模板的头文件，再写类的实现。
    4. 可以直接选择Cocoa Class。同时创建`.h`和`.m`文件
10. 对象做为方法的参数
    1. 类的本质是自定义的数据类型。数据类型就是内存中开辟空间的模板
    2. 类作为方法的参数 `-(void)test:(Dog *) dog;`
    3. 语法注意
        1. 对象作为方法的参数，参数类型是类指针
        2. 调用方法的时候，方法的参数是一个对象，给实参的时候，要给类对应的对象
        3. 地址传递，可以在方法内部对对象进行修改
12. 对象作为方法的返回值
    ```
    -(Dog *)test;
    -(Dog *) test {
        Dog *d1 = [Dog new];
        return d1;
    }
    ```
13. 一个target中的类无法直接在另一个targer中访问
14. 对象可以做为类的属性，因为属性的本质就是变量