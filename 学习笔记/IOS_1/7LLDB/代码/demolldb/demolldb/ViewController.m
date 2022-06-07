//
//  ViewController.m
//  demolldb
//
//  Created by 大彪 on 2021/9/11.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<Person *> * models;

@end

@implementation ViewController

- (NSMutableArray<Person *> *)models
{
    if (!_models){
        _models = [NSMutableArray array];
    }
    return _models;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person * p1 = [[Person alloc] init];
    p1.name = @"one";
    p1.age = 1;
    Person * p2 = [[Person alloc] init];
    p2.name = @"two";
    p2.age = 2;
    Person * p3 = [[Person alloc] init];
    p3.name = @"three";
    p3.age = 3;
    
    [self.models addObject:p1];
    [self.models addObject:p2];
    [self.models addObject:p3];
    
}

-(void)HankTest1:(NSString *) str {
    [self HankTest2:str];
}

-(void)HankTest2:(NSString *) str {
    [self HankTest3:str];
}

-(void)HankTest3:(NSString *) str {
    NSLog(@"!!!%@", str);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self HankTest1:@"hank"];
}

- (IBAction)save:(id)sender {
    NSLog(@"保存");
}

- (IBAction)pause:(id)sender {
    NSLog(@"暂停");
}
- (IBAction)continueGame:(id)sender {
    NSLog(@"继续");
}

@end
