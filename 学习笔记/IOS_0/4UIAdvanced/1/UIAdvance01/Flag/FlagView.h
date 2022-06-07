//
//  FlagView.h
//  Flag
//
//  Created by lsb on 2022/5/25.
//

#import <UIKit/UIKit.h>
#import "Flag.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlagView : UIView

@property(nonatomic, strong) Flag *flag;

+(instancetype) flagViewFromNib;

@end

NS_ASSUME_NONNULL_END
