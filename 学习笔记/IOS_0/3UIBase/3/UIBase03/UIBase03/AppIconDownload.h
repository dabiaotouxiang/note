//
//  AppIconDownload.h
//  UIBase03
//
//  Created by lsb on 2022/5/16.
//

#import <UIKit/UIKit.h>
#import "AppInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppIconDownload : UIView

@property(nonatomic, strong)AppInfo *model;
+ (instancetype) appIconDownload;
@end

NS_ASSUME_NONNULL_END
