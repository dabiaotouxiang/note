//
//  ProjectManager.m
//  homework1
//
//  Created by lsb on 2022/5/2.
//

#import "ProjectManager.h"

@implementation ProjectManager

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
    if (5000 < basicWage < 9000){
        _basicWage = basicWage;
    }else {
        _basicWage = 5000;
    }
}
-(int) basicWage{
    return _basicWage;
}

-(void) setProjectDividend:(int) projectDividend{
    if (10000 < projectDividend < 20000){
        _projectDividend = projectDividend;
    }else {
        _projectDividend = 10000;
    }
}
-(int) projectDividend{
    return _projectDividend;
}

-(void) setProjectBonus:(int) projectBonus{
    if (4000 < projectBonus < 9000){
        _projectBonus = projectBonus;
    }else {
        _projectBonus = 4500;
    }
}
-(int) projectBonus{
    return _projectBonus;
}

-(void) show{
    NSLog(@"我叫%@, 每月薪水是%d", _name, _basicWage + _projectDividend + _projectBonus);
}

@end
