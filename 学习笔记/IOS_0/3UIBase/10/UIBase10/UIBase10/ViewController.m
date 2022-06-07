//
//  ViewController.m
//  UIBase10
//
//  Created by lsb on 2022/5/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:blueView];
    [self.view addSubview:redView];
    
    // 蓝色高度50
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:50];
    [blueView addConstraint:blueHeight];
    
    // 蓝色距离上面30
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    [self.view addConstraint:blueTop];
    // 蓝色距离右面30
    NSLayoutConstraint *blueRight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
    [self.view addConstraint:blueRight];
    // 蓝色距离左面30
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
    [self.view addConstraint:blueLeft];
    
    
    // 两个高度50
    NSLayoutConstraint *equalHeight =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.view addConstraint:equalHeight];
    
    // 右对齐
    NSLayoutConstraint *rightEqual =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.view addConstraint:rightEqual];
    
    // 红色距离蓝色30
    NSLayoutConstraint *redTop =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1 constant:30];
    [self.view addConstraint:redTop];
    
    //红色的左边和蓝色的中心对齐
    NSLayoutConstraint *redLeft =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:redLeft];
    
    
    // Do any additional setup after loading the view.
}


@end
