//
//  ViewController.m
//  002-对称加密
//
//  Created by lsb on 2021/8/31.
//

#import "ViewController.h"
#import "EncryptionTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // AES-ECB
    
    NSString * key = @"abc";
    NSString * encStr = [[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];
    // 命令行验证
    // echo -n hello | openssl enc -aes-128-ecb -K 616263 -nosalt | base64
    NSLog(@"ecb加密的结果是:%@", encStr);
    // 命令行验证
    // echo -n d1QG4T2tivoi0Kiu3NEmZQ== | base64 -D | openssl enc -aes-128-ecb -K 616263 -nosalt -D
    NSLog(@"ecb解密的结果是:%@", [[EncryptionTools sharedEncryptionTools] decryptString:encStr keyString:key iv:nil]);
    
    // aes-cbc 加密
    uint8_t iv[8] = {1,2,3,4,5,6,7,8};
    NSData * ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    NSString * encStr1 = [[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:ivData];
    
    NSLog(@"cbc加密的结果是:%@", encStr1);
    NSLog(@"cbc解密的结果是:%@", [[EncryptionTools sharedEncryptionTools] decryptString:encStr1 keyString:key iv:ivData]);
}


@end
