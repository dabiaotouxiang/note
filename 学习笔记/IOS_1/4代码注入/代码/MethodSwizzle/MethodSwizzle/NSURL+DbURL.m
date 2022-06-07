//
//  NSURL+DbURL.m
//  MethodSwizzle
//
//  Created by 大彪 on 2021/9/8.
//

#import "NSURL+DbURL.h"
#import <objc/runtime.h>

@implementation NSURL (DbURL)

+(void)load
{
    Method URLWithStr = class_getClassMethod(self,@selector(URLWithString:));
    Method DBURL = class_getClassMethod(self,@selector(DBURLWithStr:));
    method_exchangeImplementations(URLWithStr, DBURL);
}

+(instancetype) DBURLWithStr:(NSString *) str{
    NSURL * url = [NSURL DBURLWithStr:str];
    if (url == nil) {
        str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        url = [NSURL DBURLWithStr:str];
    }
    
    return url;
}

@end
