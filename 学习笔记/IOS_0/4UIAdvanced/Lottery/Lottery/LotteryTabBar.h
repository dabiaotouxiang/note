//
//  LotteryTabBar.h
//  Lottery
//
//  Created by lsb on 2022/6/1.
//

#import <UIKit/UIKit.h>
#import "LotteryButton.h"
NS_ASSUME_NONNULL_BEGIN

@protocol LotteryTabBarDelegate <NSObject>

-(void)barButtonClick:(LotteryButton *)button;

@end

@interface LotteryTabBar : UIView

@property(nonatomic, weak) id<LotteryTabBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andNum:(NSInteger) num;
- (void) setImageWithIndex:(int) index andImage:(UIImage *) image andImageSel:(UIImage *) imageSel;
@end

NS_ASSUME_NONNULL_END
