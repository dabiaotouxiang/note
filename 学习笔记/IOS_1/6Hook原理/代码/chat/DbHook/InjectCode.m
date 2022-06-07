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
    NSLog(@"开始Hook");
    Method old_method = class_getInstanceMethod(objc_getClass("ViewController"), @selector(btnclick1:));
    Method new_method = class_getInstanceMethod(self, @selector(myBtn));
    method_exchangeImplementations(old_method, new_method);
}

-(void)myBtn{
    NSLog(@"Hook成功");
}
@end
