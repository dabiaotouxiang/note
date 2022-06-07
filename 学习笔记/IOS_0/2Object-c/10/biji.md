# Foundation框架
## NSArray
1. NSArray的持久化
    1. 写入文件 `[arr writeToFile:@"xxx.plist" atomically: YES];`
    2. plist文件属性列表文件，可以把数组中的元素保存到文件中
    3. `[NSArray arrayWithContentsOfFile:@"xxx.plist"];`读取文件

## NSDictionary 键值对 字典数组
1. 原理
    1. 键值对存储
    2. 一旦创建，无法动态新增，删除
    3. 键只能是遵守了NSCopying协议的对象，值只能是oc对象
    4. 键不能重复，重复的话无效
2. 创建
    1. 新建对象方法创建，创建出的长度为0，无意义
        ```
        NSDictionary *dict = [NSDictionary new];
        NSDictionary *dict = [[NSDictionary alloc] init];
        NSDictionary *dict = [NSDictionary dictionary];
        ```
    2. `NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: @"值1", @"键1",@"值2",@"键2"...,nil];`
    3. 简写`NSDictionary *dict = @{@"键1":@"值1", @"键2":@"值2", ... , ...}`
3. 用法:
    1. `dict[键1]` 来取值1
    2. `[dict objectForKey: @"键1"];` 没有的话返回nil
    3. dict.count看有几个键值对
4. 遍历字典集合
    1. for加强循环
        ```
        for (id item in dict) {
            dict[item]; // item 为键
        }
        ```
    2. block代码块方法
        ```
        [dict enumerateKeyAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop){
            ...;
        }];
        ```
5. 存储数据的原理
    1. 存储的时候，键值对并不按照顺序存储，而是按照key的hash值和dict的长度酸楚下标来放置
    2. 取值的时候也是通过key算出来下标，找出下标的数据取出
    3. %@打印时按照key的ascii值进行排序打印出来。遍历的时候按照实际的顺序遍历
6. 与NSArray相比
    1. 存的时候，NSArray快
    2. 取的时候，一下子全取，NSArray快，只取指定的几个，NSDictionary快
7. 写入文件
    ```
    [dict writeToFile:@"xxx.plist" atomically: YES];
    ```
8. 读取文件
    ```
    [NSDictionary dictionaryWithContentsOfFile:@"xxx.plist"];
    ```

## NSMutableDictionary
1. 是NSDictionary的子类
2. 可以动态的增加，删除元素
3. 创建长度为0的字段也有意义 还可以这样 `NSMutableDictionary *dict = [NSMutableDIctionary dictionaryWithObjectsAndKeys:@"值1",@"键1",...,...,nil];`。 `NSMutableDictionary *dict = @{...};` 这样写不行
4. 如何新增
    1. `[dict setObject:.... forKey:....];`
    2. 如果键重复，新加的就会替换原有的
5. 如何删除
    1. `removeAllObjects`
    2. `removeObjectForKey`

## 集合
1. NSArray 和 NSDictionary之类的叫集合
2. 内存管理
    1. 对象存入集合，会为对象的引用计数器加1
    2. 集合销毁时，会为对象的引用计数器减1
    3. 使用@[],@{}创建的对象，已经是autorelease过的，用同名类方法创建的，也已经autorelease过
    4. arc下，集合的元素是强类型的
## NSFileManager
1. 创建 `NSFileManager *manager = [NSFileManager defaultManager];`返回一个单例对象
2. 判断指定地址的文件或者文件夹是否存在 `BOOL res = [manager fileExistsAtPath:@"xxx"];`
3. 判断这个文件是个文件还是一个文件夹  
    ```
    BOOL flag = NO;
    BOOL res = [manager fileExistsAtPath:path isDirectory: &flag]; 
    // flag 是YES，说明是文件夹
    ```
4. 判断文件是否可以读取 `isReadableFileAtPath:`
5. 判断文件是否可以写入 `isWritableFileAtPath:`
6. 判断文件是否可以删除 `idDeletableFileAtPath:`
7. 获取文件的属性信息 `NSDictionary *dict = [manager attributesOfItemAtPath:@"" error:nil];`
8. 获取文件夹中的所有文件和目录，不管几级都可以拿到 `NSArray *arr = [manager subpathsAtPath:@""];`
9. 获取文件夹下的一级目录   `NSArray *arr = [manager contentsOfDirectoryAtPath:@"" error:nil];`
10. 指定目录创建文件 `[manager createFileAtPath:@"" contents:(NSData *) attributes:nil];` contents是NSData类型的，attributes可以传入自定义的属性，写nil就是默认的。字符串转NSData `NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];`
11. 指定目录创建文件夹 `[manager createDirectoryAtPath:@"" withIntermediateDirestionary: YES attribute:nil error:nil];` withIntermediateDirestionary 是否一路创建，也就是是否是`mkdir -p`
12. 拷贝文件 `[manager copyItemAtPath:@"" toPath:@"" error:nil];`
13. 移动，剪切，文件重命名 `[manager moveItemAtPath:@"" toPath:@"" error:nil];`
14. 删除文件，直接完全删除 `[manager removeItemAtPath:@""];`

## NSThread
1. `[NSThreadSleepForTimeInterval: 10]` 暂停10秒

## 常见结构体
1. CGPoint 里面有两个属性，xy。double类型，用来表示控件在界面上的位置。CGPoint和NSPoint是同一个，就是名字不一样
    1. 初始化
        ```
        CGPoint p1;
        p1.x = 20;
        p1.y = 30;
        //或者是 
        CGPoint p1 = {20, 30};
        // 或者是
        CGPoint p1 = {.x=20, .y=30};
        //或者是
        CGPointMake(20, 30);
        NSMakePoint(20, 30);
        ```
2. CGSize 保存某个控件的大小
    1. 源码
        ```
        struct CGSize {
            CGFloat width;
            CGFloat height;
        };
        typedef struct CGSize CGSize; 
        // 还有一个同名的叫NSSize
        ```
    2. 创建，除了正常的结构体创建赋值还有
        ```
        CGSizeMake(20, 30);
        NSMakeSize(20, 30);
        ```
3. CGRect和NSRect
    1. 存储一个控件的位置和大小，源码
        ```
        struct CGRect{
            CGPoint origin;
            CGSize size;
        }
        ```
    2. 声明和初始化
        1. ```
        CGRect rect;
        rect.origin.x = 20;
        rect.origin.y = 30;
        rect.size.width = 100;
        rect.size.height = 40;
        ```
        2. ```
        CGRect rect;
        // 不强转的话没办法和数组区分
        rect.origin = (CGPoint){20, 30};
        rect.size = (CGSize){100, 40};
        ```
        3. ```
        CGRectMake(20, 30, 100, 40);
        NSMakeRect(20, 30, 100, 40);
        ```
4. 一般用CG开头的
5. NSValue ，因为NSArray中只能存OC对象，不能存结构体，用NSValue进行封装就可以存了
    1. `NSValue *v1 = [NSValue valueWithPoint: p1]`
    2. `NSValue *v1 = [NSValue valueWithSize: s1]`
    3. `NSValue *v1 = [NSValue valueWithRect: r1]`

## NSDate
1. `NSDate *date = [NSDate new]` 存放当前系统的UTC时间
2. 输出指定的NSDate的格式
    1. 先创建一个日期的格式化对象 `NSDateFormatter *formatter = [NSDateFormatter new];`
    2. 指定对象的转换格式 `formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";` 这的格式可以自定义
    3. 转换的时候会自动转换为系统当前时区的时间 `NSString *str = [formatter stringFromDate:date];`
3. 将字符串转换为 NSDate
    ```
    NSString *str = @"2012-12-12 12:12:12";
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:strDate]; // 转回date就变UTC时间
    ```
4. 日期计算
    1. `+(instancetype) dateWithTimeIntervalSinceNow:(NSTimeInterVal) secs;` 传入正数是加，传入负数是减。传入的是秒数
    2. `-(NSTimeInterval) timeIntervalSinceDate:(NSDate *) anotherDate;` 计算两个时间之差
5. 得到日期的各个部分
    1. 先创建一个日历对象`NSCalendar *calendar = [NSCalendar currentCalendar];` 单例对象
    2. 用calendar从date中提取出各部分
        ```
        NSDateComponents *com = [calendar components:NSCalendarUintYear|NSCalendarUintMonth|NSCalendarUintDay|NSCalendarUintWeekday fromDate: date];
        com.year;
        com.month;
        com.dar;
        com.weekdat; (7代表周六，1代表周日)
        ```
## 字符串的copy
1. 无论是MRC还是ARC下，如果属性的类型是NSString，@property用copy，不用strong，weak，assign，retain
2. copy
    1. 一个方法，定义在NSObject中，作用时拷贝对象
    2. NSString --> copy --> 没有产生新对象，直接把本身地址返回，这个叫浅拷贝。NSMutableString-->Copy-->产生一个新的对象，这个对象是一个不可变的字符串，叫深拷贝。
    3. mutableCopy 也定义在NSObject中，作用也是拷贝对象。NSString -->Copy -->产生一个新的可变字符串对象，深拷贝。NSMutableString --> Copy --> 新的可变字符串对象，深拷贝
3. 字符串拷贝的引用计数器
    1. 存在常量区的字符串，引用计数器不论拷贝几次，都不变，因为常量区的字符串不能回收，retain，release无效，程序结束后系统回收
    2. 存在堆的字符串，浅拷贝，引用计数器 加1，深拷贝，原来对象的计数器不变
4. 希望setter方法赋值的时候，是深拷贝，就用@property的copy，这样自己的属性绝对不会受实例外的其他的影响
5. copy方法是调用了copyWithZone方法，该方法定义在NSCopying协议中，我们的类没有遵守NSCopying协议，没有实现该方法，所以我们的类不能用copy方法，可以自己实现，深拷贝就是创建一个对象，再赋值，浅拷贝，就是返回当前对象的地址

## 单例模式
1. 1个类的对象，无论何时，创建的对象都是同一个对象
2. 无论如何，创建对象的时候都会用alloc方法
    1. alloc方法内部调用了allocWithZone;
    2. allocWithZone 在创建对象
3. 规范
    ```
    +(instancetype)allocWithZone:(struct _NSZone *) zone{
        static id instance = nil;
        if (instance == nil){
            instance = [super allocWithZone:zone];
        }
        return instance;
    }
    ```
4. 规范，如果类是一个单例模式，要求为类提供一个类方法，返回单例对象，命名为shared+类名，default+类名
    ```
    +(instancetype) sharedPeron{
        return [self new];
    }
    +(instancetype) defaultPerson{
        return [self new];
    }
    ```
5. 特点: 单例对象的数据可以共享，原子级的操作可以避免多个对象操作一个资源造成冲突。
