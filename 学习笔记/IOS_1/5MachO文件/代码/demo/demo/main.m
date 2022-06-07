//
//  main.m
//  demo
//
//  Created by 大彪 on 2021/9/9.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

__attribute__((constructor)) void func1(){
    printf("func1来了");
}

__attribute__((constructor)) void func2(){
    printf("func2来了");
}

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
