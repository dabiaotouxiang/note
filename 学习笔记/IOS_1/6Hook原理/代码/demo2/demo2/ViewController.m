//
//  ViewController.m
//  demo2
//
//  Created by 大彪 on 2021/9/9.
//

#import "ViewController.h"
#import "fishhook.h"
@interface ViewController ()

@end

@implementation ViewController

void func(const char * str){
    NSLog(@"%s", str);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    struct rebinding nslog;
    nslog.name = "func";
    nslog.replacement = new_func;
    nslog.replaced = (void *)&old_func;
    struct rebinding rebs[1] = {nslog};
    rebind_symbols(rebs, 1);
}

// 原始函数指针
static void(*old_func)(const char * str);

// 新的函数
void new_func(const char * str) {
    // 没有被hook
    NSLog(@"%s + 1", str);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    func("哈哈");
}
@end
