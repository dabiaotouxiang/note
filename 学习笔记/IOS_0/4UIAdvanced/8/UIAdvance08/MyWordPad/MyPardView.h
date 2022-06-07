//
//  MyPardView.h
//  MyWordPad
//
//  Created by lsb on 2022/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPardView : UIView
@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, strong) UIColor *lineColor;

-(void) clear;
-(void)back;
-(void)rubber;
-(void)save;
@end

NS_ASSUME_NONNULL_END
