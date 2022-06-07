//
//  ViewController.m
//  001-密码加密
//
//  Created by lsb on 2021/8/31.
//

#import "ViewController.h"
#import "NSString+Hash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

static NSString * salt = @"(*(*(DS*YFHIUYF(*&DSFHUS(*AD&";

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 密码
    NSString * pwd = @"123456";
    
    // MD5直接加密
    pwd = pwd.md5String;
    NSLog(@"%@", pwd);
    
    // 加盐加密
    pwd = [pwd stringByAppendingString:salt].md5String;
    NSLog(@"%@", pwd);
    
    // HMAC
    pwd = [pwd hmacMD5StringWithKey:@"hank"];
    NSLog(@"%@", pwd);
}

@end
