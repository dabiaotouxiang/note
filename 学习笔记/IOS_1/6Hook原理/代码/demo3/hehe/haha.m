//
//  haha.m
//  hehe
//
//  Created by 大彪 on 2021/9/10.
//

#import "haha.h"
#import <objc/runtime.h>
#import "fishhook.h"

@implementation haha

+ (void)load{
    NSLog(@"hehe+load");
    struct rebinding bd;
    bd.name = "method_exchangeImplementations";
    bd.replacement = myExchange;
    bd.replaced = (void * )&exchangeP;
    
    struct rebinding rebs[1] = {bd};
    
    rebind_symbols(rebs, 1);
}
void (*exchangeP)(Method _Nonnull m1, Method _Nonnull m2);

void myExchange(Method _Nonnull m1, Method _Nonnull m2){
    NSLog(@"监测到Hook");
}

@end
