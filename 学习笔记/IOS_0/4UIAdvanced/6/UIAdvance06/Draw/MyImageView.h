//
//  MyImageView.h
//  Draw
//
//  Created by lsb on 2022/5/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyImageView : UIView

@property(nonatomic, strong) UIImage *image;
- (instancetype) initWithImage:(UIImage *) image;
@end

NS_ASSUME_NONNULL_END
