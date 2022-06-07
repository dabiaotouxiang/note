//
//  main.m
//  day02-ocbase
//
//  Created by lsb on 2022/4/30.
//

#import <Foundation/Foundation.h>
#import "Judge.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Judge * judge = [Judge new];
        judge.name = @"黑哨";
        [judge judgeHandType];
    }
    return 0;
}
