1. static 关键字在C中的作用
    1. 修饰局部变量为静态变量
    2. 修饰全局变量为静态变量
    3. 修饰函数
2. OC中的static关键字
    1. 不能修饰属性， 也不能修饰方法
    2. 可以修饰方法中的局部变量
        1.  如果方法中的局部变量被static修饰，就会变静态变量存在常量区，方法结束后不会被回收，下载在执行该方法的时候直接用
        2. 比如给类添加比上一个加一的id
3. self 关键字
    1. 在方法的内部可以定义一个和属性名相同的局部变量，再直接访问属性名就是在访问局部变量
    2. 这时候可以用self，在对象和类方法中使用，对象中指向当前对象，类中指向当前类。
    3. self用在对象方法中
        1. 指向当前对象
        2. 必须用self的场景
            1. 方法中有与属性相同的局部变量
            2. 方法中调用对象的其他方法
        3. 选用 当前方法中不存在和属性同名的局部变量
    4. self用在类方法中
        1. 代码区中存储类代码的空间也有地址
        2. self在类方法中就指向该地址
        3. 查看类在代码区中的地址
            1. 调试看isa
            2. 在类方法中打印self的值
            3. 打印对象的class方法 `NSLog(@"%p", [p1 class]);`
            4. 打印类的class方法 `NSLog(@"%p", [Person class]);`
        4. 作用，在类方法中显式的调用本类的其他类方法，建议用self进行调用，不要用类名
4. 对象方法可以声明多次相同的，但是只能实现一次，否则报错，对象方法之间不能重名，类方法之间也不行，但是类方法和对象方法之间可以重名
5. 注意: 
    1. 对象方法不能用self区调用类方法，因为self指向的是对象
    2. 类方法中不能用self区调用属性和对象方法
6. 继承
    1. 语法
        ```
        @interface 类名: 父类的名称
        @end
        ```
    2. 术语
        ```
        @interface Student:Person
        ```
        1. Student类从Person类继承，Student类是Person类的子类，Person类是Student类的父类
        2. Student类从Person类派生，Student类是Person类的派生类，Person类是Student类的基类
7. 在新创建类的时候指定父类，Xcode会帮你倒入和继承
8. 继承是类在继承而不是对象在继承
9. 什么时候继承在：如果一个类的成员我也想有就用继承，满足is a关系的
10. 只要有一个成员不是所有的子类都有的就不应该写入父类
11. 继承的特点
    1. 单根性，一个类只能有一个父类，不能有多个父类
    2. 传递性，A类从B类继承，B类从C类继承，那么A同时有B和C的成员
    3. NSObject类：是Foundation框架中的类，在这个类中有一个类方法new，这个方法是用来创建对象的，方法的返回值是创建的对象的指针，如果要创建的对象必须用new方法，所以必须有直接或者间接的继承自NSObject才能创建对象。isa属性也是来自NSObject。NSObect类是OC中的祖宗类。因为OC中的类全是直接或者间接继承自它
12. 子类中不能存在父类同名属性，因为子类已经继承了，再定义同名属性，就冲突了
13. super关键字
    1. 可以用在类方法和对象中
    2. 在对象方法中可以用super关键子调用当前对象从父类继承过来的对象方法
    3. 在类方法中可以用super关键字调用当前类从父类那继承过来的方法
    4. super只能用来调用父类的对象方法或者类方法，不能访问属性
    5. super特指父类继承过来的
14. 访问修饰符，用来修饰类的属性的，可以限定对象的属性在哪一段中可以访问
    1. 分类:
        1. `@private`私有的 只能在本类的内部访问(只能在本类的方法实现中访问)
        2. `@protected`受保护的 只能在本类和本类的子类中访问
        3. `@package`只能在当前框架中访问
        4. `@public` 可以任意的访问
    2. 不写的话默认是protected
    3. 私有的属性依然会被子类继承，但是子类中无法直接访问，继承来的私有属性，可以调用父类方法为私有属性赋值，有super去使用
    4. 访问修饰符的作用域，从访问修饰符开始到下一个访问修饰符或者大括号结束时结束
    5. 使用建议:
        1. `@public`,无论什么时候都不用
        2. `@private`, 希望属性只在本类中使用
        3. `@protected`, 在本类和本类的子类中使用，推荐
    6. 访问修饰符只能修饰属性，不能修饰方法

15. 私有属性和私有方法
    1. 私有属性在Xcode中有提示，想要无提示，就把属性写在`@implemetation`中，不用在加`@private`，这里面的属性就是私有的，各种访问修饰符无效，因为C就是要用headers文件来进行引入和提示，headers中没有，就无法引入到其他地方了
    2. 私有方法，只写实现，只能在本类中使用，和私有属性一个原理
16. 里氏替换原则 --- LSP
    1. 子类可以替换父类的位置，而且程序的功能无影响
    2. 表现形式: 一个父类指针指向一个子类的对象时。
    3. 作用: 
        1. 一个指针不仅可以存储本类对象的地址，还可以存储子类的对象的地址
        2. 如果一个指针是NSObject类型的，那么指针中可以保存任意OC对象的地址
        3. 如果以一个数组的元素的类型是一个OC类型的指针，那么这个数组可以存储其所有的子类和本类
        4. 如果一个方法的参数是一个对象，那么传值的时候，可以传一个本类对象，也可以传一个子类对象。对方法中的代码无影响
    4. 当一个父类指针，指向一个子类对象时，只能调用共有的成员，不能调用子类特有的
17. 方法的重写
    1. 子类继承父类的方法，但是子类的方法的实现和父类不同，就需要重写，直接在类的实现中，将这个方法重新实现一遍就行了。
    2. 当父类的指针指向一个子类的时候，通过父类指针调用的方法在子类中重写了，调用的就是重写的方法
18. 多态
    1. 同一个行为，对不同的事物有完全不同的表现形式，同一个行为，多种形态
19. description 方法 NSObject类中的方法，调用%@打印对象的时候，输出的就是description方法的返回值，我们可以重写该方法，让@打印自己想要的结果 
    1. NSObject中的实现 `@<对象所属的类名: 对象的地址>`