//
//  QQMessageFrame.h
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QQMessages.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQMessageFrame : NSObject

@property(nonatomic, strong) QQMessages *message;

@property(nonatomic, assign, readonly) CGRect textFrame;

@property(nonatomic, assign, readonly) CGRect timeFrame;

@property(nonatomic, assign, readonly) CGRect iconFrame;

@property(nonatomic, assign) CGFloat cellHeight;

@property(nonatomic, assign) BOOL hidenTime;

@end

NS_ASSUME_NONNULL_END
