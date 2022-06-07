//
//  WheelView.h
//  UIAdvance11
//
//  Created by lsb on 2022/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WheelViewDelegate <NSObject>

- (void) showAlert;

@end

@interface WheelView : UIView

@property(nonatomic, weak) id<WheelViewDelegate> delegate;

+(instancetype) loadFromNib;
-(void) clickBtn:(UIButton *) sender;
@end

NS_ASSUME_NONNULL_END
