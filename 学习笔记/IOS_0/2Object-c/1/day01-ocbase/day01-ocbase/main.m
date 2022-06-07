//
//  main.m
//  day01-ocbase
//
//  Created by lsb on 2022/4/28.
//

#import <Foundation/Foundation.h>
// 狗类
@interface Dog : NSObject
{
    @public
    NSString *_color;
    int _spead;
    NSString *_sex;
    float _weight;
}
-(void) eat;
-(void) say;
-(void) run;
@end

@implementation Dog
-(void) eat{
    _weight = _weight + 0.5f;
    NSLog(@"吃完后体重是%.2f", _weight);
}
- (void)say{
    NSLog(@"狗的颜色是%@, 速度是%dm/s, 性别是%@, 体重是%.2f", _color, _spead, _sex, _weight);
}
- (void)run{
    _weight = _weight - 0.5f;
    NSLog(@"狗的速度是%dm/s, 体重是%.2fkg", _spead, _weight);
}

@end
// 学生类
@interface Student : NSObject
{
    @public
    NSString *_name;
    NSString *_birth;
    int _age;
    float _height;
    float _weight;
    NSString *_sex;
    int _cScore;
    int _ocScore;
    int _iOSScore;
}
-(void) run;
-(void) eat;
-(void) learn;
-(void) sleep;
-(void) sumScore;
-(void) avrageScore;
@end

@implementation Student
- (void)run{
    _height += 0.01f;
    _weight -= 0.5f;
    NSLog(@"体重是%.2f", _weight);
}
- (void)eat{
    _height += 0.01f;
    _weight += 0.5f;
    NSLog(@"体重是%.2f", _weight);
}
- (void)learn{
    _cScore += 1;
    _ocScore += 1;
    _iOSScore += 1;
    NSLog(@"C语言成绩是%d, OC成绩是%d, iOS成绩是%d", _cScore, _ocScore, _iOSScore);
}
- (void)sleep{
    NSLog(@"%@的生日是%@, 年龄是%d, 身高是%.2fm, 体重是%.2fkg, 性别是%@, C语言的成绩是%d, oc的成绩是%d, iOS的成绩是%d", _name, _birth, _age, _height, _weight, _sex, _cScore, _ocScore, _iOSScore);
}
- (void)sumScore{
    NSLog(@"总成绩是%d", _cScore + _ocScore + _iOSScore);
}
- (void)avrageScore{
    NSLog(@"平均成绩是%d", (_cScore + _ocScore + _iOSScore) / 3);
}
@end

// 车类
@interface Car : NSObject
{
    @public
    NSString *_brand;
    NSString *_xingHao;
    NSString *_color;
    int _seatNum;
    int _wheelNum;
    int _oilNum;
}
-(void)run;
-(void)stop;
-(void) onOil;
@end

@implementation Car

- (void)run{
    _oilNum -= 1;
    NSLog(@"当前的油的数量是%d", _oilNum);
}

- (void)stop{
    NSLog(@"%@的汽车停止了", _brand);
}
- (void)onOil{
    NSLog(@"当前的油量是%d", _oilNum);
}

@end

// 球队
@interface Team : NSObject

{
    NSString *_name;
    int _playerNum;
    int _instrutorNum;
    int _successNum;
    int _failNum;
}
-(void)show;
@end

@implementation Team

- (void)show{
    NSLog(@"我们球队的名称为%@, 有%d名球员, 有%d名教练，胜利场数%d, 失败场数%d.", _name, _playerNum, _instrutorNum, _successNum, _failNum);
}

@end

// 电脑类
@interface Computer : NSObject

{
    NSString *_brand;
    int _price;
}

@end

@implementation Computer


@end

// book
@interface Book : NSObject

{
    NSString *_name;
    int _num;
    NSString *_auther;
    int _price;
    int _pageNum;
}

-(void)show;

@end

@implementation Book

- (void)show{
    NSLog(@"书名为%@，书号为%d，作者为%@，价格为%d，页码为%d", _name, _num, _auther, _price, _pageNum);
}

@end

// 手机类
@interface Phone : NSObject

{
    NSString *_color;
    float _size;
    NSString *_cpu;
}

-(void)callWithPhoneNum:(NSString *)phoneNum;
-(void)smsWithPhoneNum:(NSString *)phoneNum andWithMessage:(NSString *)message;
@end

@implementation Phone

- (void)callWithPhoneNum:(NSString *)phoneNum{
    NSLog(@"给%@打电话", phoneNum);
}

- (void)smsWithPhoneNum:(NSString *)phoneNum andWithMessage:(NSString *)message{
    NSLog(@"给%@发短信，内容为%@", phoneNum, message);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Student *s1 = [Student new];
        s1->_name = @"jack";
        s1->_age = 11;
//        s1->_yuwen = 11;
//        s1->_math = 11;
//        s1->_english = 11;
        
        Phone *p1 = [Phone new];
        [p1 callWithPhoneNum:@"12011111111"];
        [p1 smsWithPhoneNum:@"12911111111" andWithMessage:@"你好"];
        NSLog(@"Hello, World!");
    }
    return 0;
}
