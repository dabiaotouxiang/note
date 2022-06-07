//
//  GroupBuyTableViewFooter.h
//  GroupBuy
//
//  Created by lsb on 2022/5/22.
//

#import <UIKit/UIKit.h>
@class GroupBuyTableViewFooter;
NS_ASSUME_NONNULL_BEGIN



@protocol GroupBuyTableViewFooterDelegate <NSObject>


- (void) addCell:(GroupBuyTableViewFooter *) footView;

@end

@interface GroupBuyTableViewFooter : UIView

@property(nonatomic, weak) id<GroupBuyTableViewFooterDelegate> delegate;
+ (instancetype) loadNib;

-(void) endLoad;

@end


NS_ASSUME_NONNULL_END
