//
//  SoftwareEngineer.m
//  homework1
//
//  Created by lsb on 2022/5/2.
//

#import "SoftwareEngineer.h"

@implementation SoftwareEngineer

-(void) setName:(NSString *) name{
    if ([name length] > 2) {
        _name = name;
    }else{
        _name = @"无名";
    }
}
-(NSString *) name{
    return  _name;
}

-(void) setBasicWage:(int) basicWage{
    if (3000 < basicWage < 5000){
        _basicWage = basicWage;
    }else {
        _basicWage = 3000;
    }
}
-(int) basicWage{
    return _basicWage;
}

-(void) setProjectBonus:(int) projectBonus{
    if (3500 < projectBonus < 7000){
        _projectBonus = projectBonus;
    }else {
        _projectBonus = 4500;
    }
}
-(int) projectBonus{
    return _projectBonus;
}

-(void) show{
    NSLog(@"我叫%@, 每月薪水是%d", _name, _basicWage + _projectBonus);
}

@end
