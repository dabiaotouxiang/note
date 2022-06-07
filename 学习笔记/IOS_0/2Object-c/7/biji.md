1. 自动释放池
    1. 原理: 存入自动释放池中的对象，在自动释放池被销毁时，会自动调用存储在该自动释放池的所有对象的release方法
    2. 如何创建: 
        ```
        @autoreleasepool{

        }
        ```
    3. 如何将对象存储到自动释放池? 在autorelease的大括号中调用对象的autorelease方法，返回值是对象本身
        ```
        @autoreleasepool{
            Person *p1 = [Person new];
            [p1 autorelease];
        }
        ```
        可以这么写
        ```
        @autoreleasepool{
            Person *p1 = [[Person new] autorelease];
            // 或者是
            Person *p1 = [[[Person alloc] init] autorelease];
        }
        ```
    4. 注意
        1. 只有在池中调用了autorelease方法后，才能把对象存至自动释放池
        2. 对象的创建可以放在自动释放池外面，autorelease方法在池的内部执行
        3. autorelease方法一定不能放到自动释放池外
        4. 只是自动调用1次release方法，抵消创建时的增加，并不是销毁对象
        5. 在自动释放池中调用1个对象的autorelease方法多少次，就会在自动释放池结束时，release多少次，这个时候就有可能出现野指针，僵尸对象
        6. 自动释放池中调用了对象的release方法，自动释放池结束的时候，还会调用release方法，可能会野指针
        7. 将对象放入自动释放池中，不会改变对象本身的引用计数器，好处是创建对象对应的release不用写了
        8. 自动释放池可以嵌套。其他的setterdealloc方法和昨天一样
    5. 规范
        1. 创建对象，将对象存储至自动释放池中，就不用再手动的release了
        2. 一般情况下，会为我们的类写一个方法，用来让外界调用类方法，快速的得到一个对象，规范如下
            ```
            +(instancetype) person{
                return [[[self alloc] init] autorelease];
            }
            ```
        3. Apple框架中的类都autorelease过了，我们也要遵守，类方法返回的对象都要autorelease
2. ARC
    1. 系统自动帮我们计数，对象的引用计数器的值。在ARC中不写retain，release和autorelease。ARC开启后，编译器会在合适的地方插入retain，release，autorelease代码，ARC是编译机制，编译的时候自动加上代码
    2. ARC下，对象什么时候释放?
        1. 本质: 对象的引用计数器为0的时候
        2. 表象: 只要没有强指针指向该对象，该对象就会立即回收
    3. 强指针与弱指针:
        1. 默认情况下，声明一个指针就是强指针，也可以用__strong 显式标注 `__strong Person *p1`或者 `Person *p1`
        2. 弱指针: `__weak Person *p1`
        3. 无论强弱都是指针，用来访问对象，存储对象地址，唯一区别就是用来作为ARC回收的标准。
3. ARC下单个对象的内存管理
    1. 不能用一个弱指针用于存储刚创建的对象，会被立即回收 类似这样的 `__weak Person *p1 = [[Person alloc] init];`
    2. 在ARC下，对象被回收后，原来指向的对象的弱指针自动改为nil
4. ARC下多个对象的内存管理
    1. @property的retain参数不能在ARC机制下使用，该参数是MRC下使用
    2. 一个类的属性是OC对象的时候，应该是强类型的指针
    3. 用@property的参数，strong，weak来控制生成的属性是强类型的，还是弱类型的。`@property (nonatomic, strong) Car * car;`。
    4. 建议
        1. 属性类型是oc对象，用strong
        2. 不是oc对象，用assign
        3. strong和weak用在属性是oc对象的时候。
        4. ARC机制下，把OC对象属性的retain改为strong，其他类型的属性用assign
5. ARC下的循环引用: 两个对象互为对方的属性，其中一个用weak
6. @property的参数的总结
    1. 与多线程相关:
        1. atomic默认，线程锁，安全，效率低
        2. nonatomic 不安全，效率高
        3. 无论是ARC还是MRC都可以用
    2. 与内存机制有关的:
        1. retain 代表生成标准的内存管理diamanté，仅限MRC下的属性为OC对象的情况下使用，当出现循环引用的时候，1边用retain，1边用assign
        2. assign 属性为非oc对象的时候，使用assign，MRC，ARC都用
        3. strong ARC下，属性是oc对象，强指针，不写默认是strong
        4. weak ARC下，属性是oc对象，弱指针，出现循环引用的时候，一端strong，一端weak
    3. readonly和readwrite
    4. setter，getter 方法名的修改
7. MRC与ARC的混合编译，对于MRC的文件，在Build Phases中添加 -fno-objc-arc
8. MRC转为ARC
    1. 点击，在edit->convert->To Objective-c ARC
    2. 这个转换相当粗暴，还要大量的调试，而且转不回去
9. 分类，或者叫分组，category
    1. 默认情况下，1个类占据一个模块，所有的成员写在一个模块中，就很难管理
    2. 分类的作用: 将1个类分成多个模块
    3. 如何添加category，选择New file，选择OC class，选择filetype是category，Class选择要被分的类。会生成一个包含.h文件和.m文件的模块
    4. 生成的模块的特点:
        1. 文件名: 本类名 + 分类名 .h 本类名 + 分类名 .m 
        2. 添加的分类也氛围声明和实现
            ```
            @interface 本类名(分类名)
            @end
            代表是给已有的类添加一个分类
            @implemetation 本类名(分类名)
            @end
            ```
    5. 分类的使用
        1. 要访问分类中定义的成员，就把分类的头文件引入
    6. 分类注意
        1. 只能增加分类方法，不能增加属性
        2. 在分类中写@property，不会生成私有属性，setter和getter的实现也不会生成，只会生成setter和getter的声明
        3. 在分类中不能直接访问本类的真私有属性（定义在本类的.m文件中的）但可以用setter和getter间接访问
        4. 当分类中有与本类同名的方法时，优先调用分类的方法，及时没有引入分类的头文件，如果多个分类有相同的方法，优先调用最后编译的那个
    7. 什么时候使用分类，当一个类的方法很多很杂的时候
    8. 为系统自带的类写分类就叫非正式协议
    9. 分类可以为已经存在的类添加方法
10. ARC与GC机制的区别
    1. GC时JAVA的垃圾回收机制，运行时，垃圾回收器定时不断的扫描是否有对象无人使用，有就回收
    2. ARC是编译的机制，编译的时候就添加retain，release，autorelease方法，让对象的计数器可以加减归零，归零后释放