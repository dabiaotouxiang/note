//
//  MyView.h
//  GestureToUnlock
//
//  Created by lsb on 2022/5/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MyViewDelegate <NSObject>

- (void) changeImg:(UIImage *) image;

@end
@interface MyView : UIView
@property(nonatomic, copy) BOOL(^pwdBlock)(NSString *);
@property(nonatomic, weak) id<MyViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
