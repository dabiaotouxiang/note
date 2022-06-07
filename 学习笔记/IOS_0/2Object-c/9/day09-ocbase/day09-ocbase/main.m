//
//  main.m
//  day09-ocbase
//
//  Created by lsb on 2022/5/10.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        1.
//        NSString *str = [NSString stringWithContentsOfFile:@"/Users/lsb/Desktop/abc.txt" encoding:NSUTF8StringEncoding error:nil];
//
//        str = [str stringByAppendingString:str];
//        BOOL res = [str writeToFile:@"/Users/lsb/Desktop/abc.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        if (res) {
//            NSLog(@"success");
//        }else{
//            NSLog(@"fail");
//        }
//        2.
//        NSLog(@"请输入一个网址:");
//        char chlist[256];
//        scanf("%s", chlist);
//        NSString *str = [NSString stringWithUTF8String:chlist];
//        if (![str hasPrefix:@"http://"]){
//            NSLog(@"非法网址");
//        }
//        // insert code here...
//        NSLog(@"Hello, World!");
//        3.
//        NSString *str = @"highven@qq.com";
//        NSArray *arr = [str componentsSeparatedByString:@"@"];
//        NSLog(@"主机名%@, 用户名%@", arr[1], arr[0]);
//        4.
//        NSString *str = @"共产党真伟大，人民领袖千秋颂，法轮功祸害人，李洪志躲在国外不见人";
//        str = [str stringByReplacingOccurrencesOfString:@"共产党" withString:@"GCD"];
//        str = [str stringByReplacingOccurrencesOfString:@"法轮功" withString:@"xxx"];
//        str = [str stringByReplacingOccurrencesOfString:@"李洪志" withString:@"李某某"];
//        NSLog(@"%@", str);
//        5.
//        NSString *str = @"今天的心情真好啊，哈啊哈哈，因为只有3天就要正式学习iOS开发了 2015-07-29 20:14:45";
//        NSArray *arr = [str componentsSeparatedByString:@" "];
//        NSLog(@"日期为%@, 时间为%@", arr[1], arr[2]);
//        6.
        NSString *str = @"19 10 9 34 56 89 90 12 34 87 119 2";
        NSMutableArray *arr = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@" "]];
        for (int i = 0; i < (arr.count -1); i++){
            for (int j = i + 1; j < arr.count; j++){
                if ([(NSString *)arr[i] compare:(NSString *)arr[j] options:NSNumericSearch] < 0){
                    NSString *tmp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = tmp;
                }
            }
        }
        str = [arr componentsJoinedByString:@" "];
        NSLog(@"%@", str);
    }
    return 0;
}
