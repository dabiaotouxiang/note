//
//  WBStatusFrames.h
//  WeiboRepeat
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "WBStatus.h"
NS_ASSUME_NONNULL_BEGIN

@interface WBStatusFrames : NSObject

@property(assign, nonatomic, readonly) CGRect iconFrame;
@property(assign, nonatomic, readonly) CGRect nameFrame;
@property(assign, nonatomic, readonly) CGRect vipFrame;
@property(assign, nonatomic, readonly) CGRect textFrame;
@property(assign, nonatomic, readonly) CGRect pictureFrame;
@property(assign, nonatomic, readonly) int cellHeight;
@property(strong, nonatomic) WBStatus *status;

- (instancetype) initWithStatus:(WBStatus *) status;
+ (instancetype) statusFrameWithStatus:(WBStatus *) status;
+(NSArray *)statusFramesWithStatuses:(NSArray *)statusModels;

@end

NS_ASSUME_NONNULL_END
