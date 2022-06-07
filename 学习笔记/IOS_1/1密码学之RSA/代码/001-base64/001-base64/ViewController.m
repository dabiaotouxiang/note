//
//  ViewController.m
//  001-base64
//
//  Created by lsb on 2021/8/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 给一个字符，进行编码
-(NSString *)base64Encode:(NSString *) str {
    NSData * data = [str dataUsingEncoding:(NSUTF8StringEncoding)];
    return [data base64EncodedStringWithOptions:0];
}


// 给一个编码进行解码
-(NSString *)base64Decode:(NSString *) str {
    NSData * data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", [self base64Encode:@"A"]);
    NSLog(@"%@", [self base64Decode:@"QQ=="]);
}

@end
