//
//  ViewController.m
//  002-RSA加密解密
//
//  Created by lsb on 2021/8/27.
//

#import "ViewController.h"
#import "RSACryptor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    
    // 家在私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSData * ret = [[RSACryptor sharedRSACryptor] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    // 进行编码
    NSString * base64 = [ret base64EncodedStringWithOptions:0];
    NSLog(@"%@", base64);
    // 进行解码
    NSData * jiemi = [[RSACryptor sharedRSACryptor] decryptData:ret];
    NSLog(@"%@", [[NSString alloc] initWithData:jiemi encoding:NSUTF8StringEncoding]);
}

@end
