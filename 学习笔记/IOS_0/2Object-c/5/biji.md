1. 对象在内存中如何分配的
    1. 子类对象中有自己的属性和所有的父类的属性
    2. 代码段中每一个类都有1个isa指针，指向它的父类，一直到NSObject类。
        1. 例如`[s1 sayHi];`先去Student类中找，没有就根据isa指针去Person父类中找该方法，Person没有就再去person的父类中找，一直到NSObject中去，没有就报错
        2. 方法重写后，子类中就有方法了，不用去父类中找了
2. 结构体和类
    1. 相同点: 都可以将多个数据封装为一个整体
    2. 不同点:
        1. 类不仅可以封装数据，还可以封装行为
        2. 结构体变量是在栈空间(局部变量),对象在对空间，栈中的数据访问效率高，空间相对堆小，堆中的数据访问效率低，空间相对栈大
        3. 赋值
            1. 结构体Student，类Person
            2. `Student s1 = {@"jack", 19}; Student s2 = s1;` 值传递
            2. `Person *p1 = [Person new]; Person *p2 = p1`; 地址传递
    3. 应用场景: 
        1. 实体，不仅有数据还有行为就用类
        2. 如果表示的实体没有行为，只有属性，而且属性不是很多，就用结构体，属性多，就用类
3. 类的本质
    1. 类加载代码到代码段中是不会被回收的，除非程序结束
    2. 类是以什么样的形式存储在代码段中
        1. 任何存储在内存中的数据都有数据类型，任何在内存中申请的空间也有自己类型。
        2. 在代码段汇总存储的类的空间的类型
            1. 先在代码中创建一个Class对象，Class是Foundation框架的一个类
            2. 将类的信息存在CLass对象中，Class对象至少3个属性
                1. 类名
                2. 属性
                3. 方法
            3. 所以类是以Class对象的形式存储在代码段的，这个CLass对象叫类对象，isa指针指向父类的类对象
4. 如何拿到代码中的类对象
    1. 调用类方法
        ```
        Class c1 = [Person class];
        NSLog(@"c1 = %p", c1);
        ```
    2. 调用对象的class方法
        ```
        Person *p1 = [Person new];
        Class c1 = [p1 class]; 
        NSLog(@"c1 = %p", c1);
        ```
    3. 声明Class指针的时候不用加* ，因为Class是一个typedef类型，typedef中有*。
5. 使用类对象
    1. `Class c1 = [Perosn class]`  c1 就是Person类
    2. 使用类对象可以调用类方法
    3. 使用类对象创建对象
6. SEL 全称selector选择器，是一个数据类型，所以要在内存中申请空间存储数据。SEL是一个类，SEL对象是用来存储方法的
    1. 在Class类对象中，用SEL类来存储方法，多个SEL对象以数组的形式作为属性存储于Class类对象中
    2. 拿到SEL对象
        1. `SEL s1 = @selector(方法名);` 方法名直接写。
        2. SEL是一个typedef自定义类型，typedef中已经有*了，不用再加星号
    3. 方法的本质
        1. 拿到存储方法的SEL数据，或者叫SEL消息。直接用方法名去找SEL数据（消息）
        2. 将找到的SEL消息发送至对象
        3. 对象接受消息，要调用该方法
        4. 根据对象的isa指针找到类对象
        5. 类对象中查找是否有与之对应的SEL对象，有就执行，没有就去父类找，父类都没有就报错
    4. 手动为对象发送SEL消息
        ```
        SEL s1 = @selector(sayHi);
        [p1 performSelector: s1];
        ```
    5. 注意
        1. 带参数的方法的方法名带冒号
        2. 调用带参数的SEL消息的时候
            1. 两个参数之内
                ```
                [p1 performSelector: s1 withObject: 参数1];
                [p1 performSelector: s1 withObject: 参数1 withObject: 参数2];
                ```
            2. 多个参数的时候，把多的参数封装进类或者结构体
7. 点语法
    1. 使用点语法访问对象的属性
        1. 语法 `对象名.去掉下划线的属性名;`,可以赋值也可以取值
        2. 原理。本质上是编译器编译的时候替换为setter和getter
    2. 注意:
        1. 在类的内部的setter和getter内部，慎用，可能会造成无限递归，类的其他方法内部可以用
        2. setter，getter方法，还有点语法要符合规范，没有setter和getter方法，不能用点语法
8. @property
    1. 作用: 自动生成getter和setter的声明
    2. 语法: @property 数据类型 属性名去掉下划线; 写在类的声明的属性大括号外
    3. 原理: 编译的时候自动生成。
9. @synthesize
    1. 作用: 自动生成setter和getter的实现
    2. 语法: `@synthesize 变量名去掉下划线;` 写在@implemetation中
    3. 原理:
        1. 生成一个真私有的属性，类型和对应的@property类型一致，名称为属性名去掉下划线
        2. 自动生成setter方法的实现，将参数直接赋值给私有的属性，并且无任何验证逻辑
        3. 自动生成getter方法的实现，直接返回私有属性的值，无任何验证逻辑
    4. 希望@synthesize不要自动生成，在setter和getter操作我们写好的
        1. 语法:  `@synthesize` 不要自动生成，在setter和getter中操作我们写好的
        2. 这样不会再生成私有属性，setter和getter中也是我们指定的属性。
10. `@property int arg1, artg2;` 同类型的可以批量声明
    `@synthesize arg1, arg2;` 不同类型也可以批量
11. @property 的增强:
    1. @property和@synthesize是Xcode4.4之前的
    2. Xcode4.4之后的@property增强了
        1. 语法 
            ```
            @interface Student: NSObject
            @property NSString *name;
            @end
            ```
        2. 做的事情:
            1. 自动生成带下滑线的私有属性
            2. 自动生成setter和getter方法的声明
            3. 自动生成setter和getter方法的实现
        3. 可以批量声明同类型的
        4. 可以自己写setter，还会自动生成getter。可以自己写getter，还会自动生成setter。两个都自己写，就不会再自动声明属性，就要自己写了
        5. 父类的@property一样可以被继承，但是@property声明的是私有的属性，无法被直接访问，要用setter和getter方法
12. 动态类型和静态类型
    1. oc是弱语言，编译器堆语法的检查并没有那么严格
        1. 优点: 灵活
        2. 缺点: 太灵活了，好多错在编译阶段无法检查出来
    2. 静态类型: 指一个指针指向的是一个本类的对象。动态类型: 指一个指针指向的不是本类的对象
    3. 编译检查: 
        1. 编译器编译的时候，能不能通过一个指针去调用指针指向的对象的方法
        2. 判断原则: 指针所属的类型中有这个方法，就通过，否则不通过
        3. 可以通过强转来骗过编译器 `(xxx *)s1` 将s1 强转为xxx类型的
    4. 运行检查: 运行时检查对象中是否真的有该方法，有就运行，没有就报错
    5. LSP 父类指向子类对象，实际任意指针可以指向任意对象
13. NSObject指针和id指针
    1. NSObject指针可以指向任何OC对象，是一个万能的指针，缺点是当调用的指向的子类的独有的方法的时候，要做类型强转
    2. id指针，可以指向任意类型的OC对象。
        1. 是一个typedef类型，定义时加了* 。所以声明的时候不用*
    3. NSObject和id的相同点: 都是万能指针，都可以指向任何对象
    4. NSObject和id的不同点: id类型的，编译器直接通过。NSObject会检测
    5. 注意: id指针不能用点语法，只能用方法
14. instancetype 
    1. 类方法创建对象，因为继承，所以要这么写，但是id类型谁都可以接收
        ```
        + (id) person{
            return [self new];
        }
        ```
    2. 这样写,instancetype代表的就是当前类对象
        ```
        +(instancetype) person{
            return [self new]
        }
        ```
    3. 建议
        1. 方法内部创建当前类对象，不要用类名，用self，因为类会继承
        2. 方法的返回值是当前类对象，用instancetype
    4. id和instancetype的区别
        1. instancetype只能做方法的返回值
        2. id什么都能做
        3. instancetype的类型是当前类，id没有类型
15. 动态类型检测
    1. apple的编译器 llvm
    2. 程序就算编译通过也不意味着完美执行
    3. 可以写代码判断对象中是否有这个方法，再执行，没有就别执行
        1. 判断指向的对象中是否有这个方法可以执行，最常用的，只判断有没有方法
            ```
            BOOL b1 = [p1 respondsToSelector:@selector(length)];
            ```
        2. 判断指向的对象是否属于某个类或者某个类的子类
            ```
            BOOL b1 = [p1 isKindOfClass:[Student class]];
            ```
        3. 判断指向的对象是否属于某个类，不包含子类
            ```
            BOOL b1 = [p1 isMemberOfClass:[Student class]];
            ```
        4. 判断某个类是否属于某个类的子类
            ```
            BOOL b1 = [Student isSubclassOfClass:[Person class]];
            ```
        5. 判断类中是否有指定的对象方法
            ```
            BOOL b1 = [Student instanceRespondToSelector:@selector(sayHi)];
            ```
16. 构造方法: 
    1. new方法的作用:
        1. 创建对象
        2. 初始化对象
        3. 把对象的地址返回
        4. 其实就是先调用alloc方法, 再调用init方法，这是创建对象的完整步骤。alloc是一个类方法，返回一个对象，init是对象方法，作用是初始化对象，给属性赋初值
        5. `Person *p1 = [Person new];` 等价于 `Person *p1 = [[Person alloc] init];`
    2. init方法
        1. 给属性赋初值，基本数据类型给0，C指针给NULL，OC指针给nil
        2. 想让创建的对象的默认值不是0，NULL, nil就重写init
        3. 规范
            ```
            @implemetation Person
            -(instancetype) init {
                if (self = [super init]){
                    self.xxx = xxx;
                    ...
                }
                return self;
            }
            ```
        4. init可能会失败，失败返回nil，所以先用if判断一下
    3. 创建对象时指定属性值，自定义构造方法
        1. 规范:
            ```
            @interface Person : NSObject
            -(instancetype) initWithName:(NSString *) name andAge:(int) age;
            @end
            @implemetation Person 
            -(instancetype) initWithName:(NSString *) name andAge:(int) age {
                if (self = [super init]){
                    self.name = name;
                    self.age = age;
                }
                return self;
            }
            @end
            ```
        2. self只能在构造方法家族中赋值，构造方法家族中包含:
            1. init方法
            2. 格式为 initWithXxx的方法