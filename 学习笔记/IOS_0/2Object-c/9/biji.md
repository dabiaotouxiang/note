# Foundation框架
## NSRange 结构体
1. 是Foundation框架的一个结构体
2. 定义
    ```
    typedef struct _NSRange {
            NSUInteger location;
            NSUInteger length;
    } NSRange;
    ```
3. 声明并初始化NSRange:
    1. `NSRange range; range.location = 1; range.length = 5;`
    2. `NSRange range = {3, 5};`
    3. `NSRange range = {.location = 2, .length = 3};`
    4. Foundation框架中的函数 `NSRange range = NSMakeRange(3, 5);`
    5. 打印NSRange `NSLog(@"%@", NSStringFromRange(range));`

## NSString
1. NSString是一个数据类型，保存OC字符串的，本质是一个类
    1. 标准的类的创建方法，创建出来是`@""`
        ```
        NSString *str1 = [NSString new];
        NSString *str1 = [[NSString alloc] init];
        NSString *str1 = [NSString string];
        ```
    2. 快速创建 `NSString *str1 = @"jack"`
2. 字符串的恒定性
    1. 使用简单的方法创建字符串对象时 `NSString *str1 = @"jack"` 也就是用一个oc字符串常量去初始化字符串指针。这个字符串在常量区
    2. 使用类方法去创建字符串对象，创建的字符串对象在堆区。`NSString *str = [NSString initWithFormat:@"jack"];`
    3. 当在内存中创建一个字符串对象后，这个字符串对象的内容无法修改
    4. 重新为字符串指针初始化值时，是重新创建一个字符串对象，并不是修改原对象。
    5. 当系统要在内存中创建字符串对象时，会先检查内存中是否有相同内容的对象，有的话直接用，没有的话再创建
    6. 存在常量区的字符串对象不会被回收
3. 字符串对象的常用方法
    1. 使用拼接方式创建一个NSString对象 `NSString *str = [NSString stringWithFormat:@"%@,你好", @"db"];`
    2. 得到字符串的长度 `str.length;`
    3. 得到字符串指定下标的字符，打印unichar用%C(大写的C) `unichar ch = [str charactorAtIndex:1];`
    4. 判断两个字符串是否相同
        1. 不能用==，==判断的是两边的变量的值，指针变量比较的是地址，常量区和堆中可能有相同的字符串，但是地址不同
        2. 用 `BOOL res = [str isEqualToString:str2];`
    5. C字符串转为oc字符串 `NSString *str = [NSString stringWithUTF8String:"11111"];`
    6. oc字符串转为C字符串 `const char *str1 = str.UTF8String;`
4. 字符串的读写
    1. 写入文件中
        ```
        NSString *str1 = @"test";
        NSError *err;
        // atomically 是否先写入临时文件，再写入文件，YES先写入临时文件，比较安全，效率低
        // encoding 编码，一般都是 NSUTF8StringEncoding
        // error 传入一个指向error指针的指针。写入文件成功，err就是nil，写入失败，就是失败的原因。可以直接传nil
        BOOL res = [str writeToFile:@"路径" atomically: YES encoding: NSUTF8StringEncoding error: &err];
        if (err != nil){
            NSLog(@"%@", err); // 打印err详细信息。
            NSLog(@"%@", err.localizedDescription); // 打印简单的err信息
        }
        ```
    2. 读取文件中的字符串  类方法
        ```C++
        [NSString stringWithContentsOfFile:@"路径" encoding: NSUTF8StringEncoding error:nil];
        ```
5. 使用URL读取字符串数据
    1. 优势。既可以来读写本地磁盘文件，也可以读写网页，ftp服务器上的文件。
    2. 不同类型的URL的写法:
        1. 本地磁盘文件: `file:///Users/xxx/Desktop/1.txt`
        2. 网页: `http://www.baidu.com`
        3. ftp文件: `ftp://server.itcast.cn/1.txt`
    3. 将不同类型的地址封装在NSURL对象之中
        1. 读取 
            ```
            NSURL *url = [NSURL URLWithString:@"http://itcast.com/1.txt"];
            NSString *str = [NSString stringWithContentOfURL:url encoding: NSUTF8StringEncoding error:nil];
            ```
        2. 写入 要有权限
            ```
            NSURL *url = [NSURL URLWithString:@"file:///Users/xxx/Desktop/1.txt"];
            NSString *str = @"heheheeh";
            BOOL res = [str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
            ```
6. 字符串的比较
    1. `NSComparisonResult res = [str1 compare:str2];` 对象方法
        2. 结果类型 
            ```
            NSOrderedAscending: str1 < str2
            NSOrderedSame:      str1 = str2
            NSOrderedDescending:str1 > str2
            ```
    2. 忽略大小写比较 `NSComparisonResult res = [str1 compare:str2 options:NSCaseInsensitiveSearch];`
    3. 仅仅比较相同格式的字符串中的数字 `NSComparisonResult res = [str1 compare:str2 options:NSNumberSearch];`
7. 字符串的开始和结束的判断
    1. 开始 `BOOL res = [str hasPrefix:@"http://"];`
    2. 结尾 `BOOL res = [str hasSuffix:@".mp3"];`
8. 在整个字符串中搜索字符串
    1. 例子
        ```
        NSString *str = @"i love itcast!";
        NSRange range = [str rangeOfString:@"love"]; 从前向后搜索，找到的是第一次的。
        // NSRange是一个结构体，
        typedef struct _NSRange {
            NSUInteger location; //子串第一次出现的位置，没有找到的时候，值为NSUInteger的最大值，也被称为NSNotFound
            NSUInteger length; // 子串匹配的长度，没有就是0
        } NSRange;
        ```
    2. `NSRange range = [str rangeOfString:@"love" options:NSBackwordsSearch];` 从后往前搜索
9. 字符串的截取
    ```
    NSString *str = @"我爱中国";
    NSString *newStr = [str substringFromIndex:3]; //从3开始截取到末尾
    NSString *newStr = [str substringToIndex:3]; // 从开始截取到3
    NSString *newStr = [str substringWithRange:NSMakeRange(2,3)]; 从2开始截取3个。
    ```
10. 字符串的替换
    1. `NSString *str1 = [str stringByReplacingOccurrenceOfString:@"中国" withString:@"人民"];`返回值必须用一个NSString接收，原来的字符串不会变
    2. 是全部替换
    3. 还可以做删除，替换为`@""`
11. 字符串的类型转换(使用频率很高)
    1. `NSString *str = @"12"; int num = str.intValue;`
    2. `NSString *str = @"12.12"; float num = str.floatValue; double num = str.doubleValue;`
    3. 还有NSInteger的integerValue，还有long long的longLongValue，还有BOOL的boolValue。从头开始转，遇到不能转的就停止.比如 `@"110aaa" 转为110 @"a110" 转为0`
12. 字符串的其他成员
    1. 去掉字符串的前后空格: `[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];` 可以通过修改改为去掉小写字母，去掉大写字母，去掉指定字符串
    2. 转大写，转小写:
        1. 转大写 `[str uppercaseString];`
        2. 转小写 `[str lowercaseString];`

## NSMutableString 存储可以改的字符串   
1. Foundation框架的一个类，继承自NSString
    1. 在NSString基础上扩展，存在NSMutableString的字符串可以修改，有可变性
2. 用法:
    ```
    NSMutableString *str = [NSMutableString string];
    ```
    1. 追加 `[str appendString:@"jack"];`
    2. 追加 `[str appendStringFormat:@"我今年%d岁了", age];` 以拼接的方式追加
    3. 创建的时候，这样写不行， `NSMutableString *str = @"jack";` 相当于子类指针指向父类的对象
3. 大批量的字符串拼接，NSMutableString块，因为只有一个对象
4. 建议平时用NSString，效率高，NSMutableString只在做大量字符串拼接的时候用(10次以上)

## NSArray
1. 是OC中的数组
2. 特点:
    1. 只能存OC对象，任意的OC对象，无法存储非OC对象。
    2. 长度固定，无法新增，也无法删除。
    3. 每个元素都是紧密相连的，有自己的下标
    4. 元素的类型是id类型。同一个数组可以存储不同类型的对象
3. 创建
    1. 因为是一个类，所以当然是创建，但是生成的长度都为0，无意义
        ```
        NSArray *arr1 = [NSArray new];
        NSArray *arr1 = [[NSArray alloc] init];
        NSArray *arr1 = [NSArray array];
        ```
    2. `NSArray *arr = [NSArray arrayWithObject:@"jack"];`只有一个元素，长度为1，无意义
    3. 最常用的方式 `NSArray *arr = [NSArray arrayWithObjects:@"jack", @"rose", @"smith", nil];`注意最后的一个元素一定要写nil表示结束。如果中途有nil。就在中途结束。
    4. 简写 `NSArray *arr = @[@"jack", @"rose", @"lili"];`最后不用加nil，加就报错，因为nil是0
4. 使用
    1. NSLog中用%@可以直接输出所有的元素的值
    2. 可以下标取值，越界直接报错
    3. `[arr objectAtIndex:index];`调用对象方法取值，越界报错
5. 其他常用的方法:
    1. arr.count: 得到数组中元素的个数。
    2. 判断是否有某个元素: `BOOL res = [arr containsObject:@"lili"];`
    3. arr.firstObject 取到第一个元素，当数组长度为0时返回nil，arr[0]在数组长度为0时报错
    4. arr.lastObject 取到最后一个元素
    5. 查找指定元素第一次出现的下标 `NSInteger index = [arr indexOfObject:@"rose"];`。没有找到，返回NSUinteger的最大值9223372036854775807，也就是NSNotFound
6. 遍历
    1. for循环
        ```
        for (int i=0; i < arr.count; i++){

        }
        ```
    2. 增强for循环
        ```
        for (NSString *str in arr){
            NSLog(str);
        }
        ```
    3. block 遍历
        ```
        -(void) enumerateObjectsUsingBlock:(void (^)ObjectType obj, NSUInteger idx, BOOL *stop))block;

        传递一个自己想对每个元素做如何处理的代码块，想停止遍历，就是让`*stop = YES`;
        ```
7. NSArray与字符串
    1. 数组转字符串
    ```
    NSArray *arr = @[@"111", @"222", @"333"];
    NSString *str = [arr componentsJoinedByString:@"#"];
    ```
    2. 字符串转数组
    ```
    NSString *str = @"1,2,3";
    NSArray *arr = [str componentsSeparatedByString:@","];
    ```
8. NSMutableArray是NSArray的子类
    1. 可以动态新增或者删除元素，其他和NSArray一致
    2. 创建，
        ```
        //有意义，可以动态新增
        NSMutableArray *arr = [NSMutableArray new];
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        NSMutableArray *arr = [NSMutableArray array]; 
        // 直接用对象创建
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"jack", @"rose", @"lili"];
        ```
    3. 下面这么写出错
        ```
        NSMutableArray *arr = @[....]; // 因为@[...]是一个NSArray对象
        ```
    4. 新增元素 `[arr addObject:@"1"]; arr addObjectsFromArray:@[...];`
    5. 在某个下标插入一个元素`[arr insertObject:@"leilei" atIndex:1];`
    6. 删除指定下标的元素`[arr removeObjectAtIndex:1];`
    7. 删除所有的特定元素`[arr removeObject:@"1"];`
    8. 删除指定范围的所有的指定元素 `[arr removeObject:@"lili", inRange:NSMakeRange(2, 3)];`
    9. 删除最后一个元素`[arr removeLastObject];`
    10. 删除所有 `[arr removeAllObjects];`

## NSNumber
1. Foundation 框架中，用来封装基本数据类型。
2. 基本数据类型存入NSNumber对象，就可以存入NSArray
3. `NSNumber *num1 = [NSNUmber numberWith...:...];`
4. 简写 
    ```
    NSNumber *num1 = @1;
    NSNumber *num1 = @1.1f;
    NSNumber *num1 = @1.1;
    NSArray *arr = @[@10, @1.1, @1.1f];
    ```
5. 将一个变量变为NSNumber
    ```
    int num = 10;
    NSNumber *num = @(num);
    ```