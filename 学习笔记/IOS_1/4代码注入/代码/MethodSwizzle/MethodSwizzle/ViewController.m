//
//  ViewController.m
//  MethodSwizzle
//
//  Created by 大彪 on 2021/9/8.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //[NSURL URLWithString:@"www.baidu.com"];
    // 上面这句话相当于向NSURL发送一个URLWithString的方法的编号，和方法的参数，用于调用方法
//    NSURL * url = objc_msgSend([NSURL class], @selector(URLWithString:), @"www.baidu.com");
//
//    NSLog(@"%@", url);
    
    NSURL * url = [NSURL URLWithString:@"www.baidu.com/中文"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //发请求
    NSLog(@"%@", request);
}


@end
