//
//  ProjectManager.h
//  homework1
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectManager : NSObject

{
    NSString *_name;
 // 基本工资
    int _basicWage;
    // 项目分红
    int _projectDividend;
    // 项目奖金
    int _projectBonus;
}

-(void) setName:(NSString *) name;
-(NSString *) name;

-(void) setBasicWage:(int) basicWage;
-(int) basicWage;

-(void) setProjectDividend:(int) projectDividend;
-(int) projectDividend;

-(void) setProjectBonus:(int) projectBonus;
-(int) projectBonus;

-(void) show;

@end

NS_ASSUME_NONNULL_END
