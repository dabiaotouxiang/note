//
//  InjectCode.m
//  DbHook
//
//  Created by 大彪 on 2021/9/8.
//

#import "InjectCode.h"
#import <objc/runtime.h>
@implementation InjectCode

//+(void)load
//{
//
//    Method old_method = class_getInstanceMethod(objc_getClass("WCAccountLoginControlLogic"), @selector(onFirstViewRegister));
//    Method new_method = class_getInstanceMethod(self, @selector(test));
//    method_exchangeImplementations(old_method, new_method);
//}
//
//-(void)test{
//    NSLog(@"状态异常不可注册");
//}

//+(void)load
//{
//    //WCAccountMainLoginViewController onNext
//    Method old_method = class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(onNext));
//    Method new_method = class_getInstanceMethod(self, @selector(my_next));
//    method_exchangeImplementations(old_method, new_method);
//}
//
//-(void)my_next{
//    NSString * pwd = [[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"] performSelector:@selector(text)];
//    NSLog(@"密码是%@", pwd);
//    [self my_next];
//}

// 类添加方法然后替换
//+ (void)load{
//    // 1. 拿到原始的method
//    Method old_method = class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(onNext));
//    //2. 添加新方法
//    BOOL didAddMethod = class_addMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(new_onNext), my_next, "v@:");
//    //3. 交换
//    method_exchangeImplementations(old_method,  class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(new_onNext)));
//}
//
//// self 是对象的id _cmd是方法编号，有参数的话，就在后面再加参数
//void my_next(id self, SEL _cmd){
//        NSString * pwd = [[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"] performSelector:@selector(text)];
//        NSLog(@"🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺密码是%@", pwd);
//        [self performSelector:@selector(new_onNext)];
//}

// 类replace方法
//
//+ (void)load{
//    // 1. 拿到原始的method的实现
//    old_method = method_getImplementation(class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(onNext)));
//    //2. 添加新方法
//    class_replaceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(onNext), my_next, "v@:");
//}
//
//IMP (*old_method)(id self, SEL _cmd);
//
//// self 是对象的id _cmd是方法编号，有参数的话，就在后面再加参数
//void my_next(id self, SEL _cmd){
//    NSString * pwd = [[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"] performSelector:@selector(text)];
//    NSLog(@"🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺密码是%@", pwd);
//    old_method(self, _cmd);
//}

// get set
+ (void)load{
    // 1. get 拿到原始的method
    Method onNext = class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), sel_registerName("onNext"));
    
    // 2. 保存原始的imp
    //sel_registerName 避免代码中太多提示
    old_onNext = method_getImplementation(onNext);
    //2. set
    method_setImplementation(onNext, (IMP)my_next);
}

IMP (*old_onNext)(id self, SEL _cmd);

// self 是对象的id _cmd是方法编号，有参数的话，就在后面再加参数
void my_next(id self, SEL _cmd){
    NSString * pwd = [[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"] performSelector:@selector(text)];
    NSLog(@"🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺密码是%@", pwd);
    old_onNext(self, _cmd);
}

@end
