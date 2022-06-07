1. theos里面添加NSLog，在console.app查看日志 需要 `#import <Foundation/Foundation.h>`
2. console.app里面的日志太长的情况下显示不全。可以在theos里面hook，把NSLog重定向到Documents文件夹下的文件，最后的文件用爱思助手在导出到电脑上
    ```c++
    %hook ONCAppDelegate

    - (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2{
        NSArray *allPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [allPaths objectAtIndex:0];
        NSString *pathForLog = [documentsDirectory stringByAppendingPathComponent:@"Log.txt"];

        freopen([pathForLog cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
        freopen([pathForLog cStringUsingEncoding:NSASCIIStringEncoding],"a+",stdout);
        return %orig;
    }
    %end
    ```
3. 对于byte []类型的NSData来说，直接用`NSLog(@"%@", data);`进行打印，过长的情况下中间会省略，这时候需要用这个`NSLog(@"data: %@", data.debugDescription);`
4. 记录一些property，用setter和getter特性进行hook
    ```
    %hook Person
    // hook了getter
    -(id)name{
        NSString *name = %orig;
        NSLog(@"name: %@", name);
        return name;
    }

    %end
    ```