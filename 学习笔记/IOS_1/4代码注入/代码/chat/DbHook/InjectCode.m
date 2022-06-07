//
//  InjectCode.m
//  DbHook
//
//  Created by 大彪 on 2021/9/7.
//

#import "InjectCode.h"
#import <objc/runtime.h>
@implementation InjectCode
+(void)load
{
    
    Method old_method = class_getInstanceMethod(objc_getClass("WCAccountLoginControlLogic"), @selector(onFirstViewRegister));
    Method new_method = class_getInstanceMethod(self, @selector(test));
    method_exchangeImplementations(old_method, new_method);
}

-(void)test{
    NSLog(@"状态异常不可注册");
}
@end
