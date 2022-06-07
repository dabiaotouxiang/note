//
//  ViewController.m
//  demo
//
//  Created by 大彪 on 2021/9/9.
//

#import "ViewController.h"
#import "fishhook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    struct rebinding nslog;
    
    nslog.name = "NSLog";
    nslog.replacement = myNSlog;
    nslog.replaced = (void *)&sys_nslog;
    
    struct rebinding rebs[1] = {nslog};
    
    // arg1 存放rebindings结构体的数组
    // rebindings数组的长度
    rebind_symbols(rebs, 1);
    
}

// 更改NSLog
// 函数指针，保存NSLog。... 代表可扩展参数
static void(*sys_nslog)(NSString * format, ...);

// 定义一个新的函数，用来代替nslog
void myNSlog(NSString * format, ...){
    format = [format stringByAppendingString:@"勾上了\n"];
    // 调用原始的
    sys_nslog(format);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击了屏幕");
}

@end
