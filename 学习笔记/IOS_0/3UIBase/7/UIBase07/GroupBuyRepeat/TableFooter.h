//
//  TableFooter.h
//  GroupBuyRepeat
//
//  Created by lsb on 2022/5/22.
//

#import <UIKit/UIKit.h>
@class TableFooter;
NS_ASSUME_NONNULL_BEGIN

@protocol TableFooterDelegate <NSObject>

-(void) loadMore;

@end

@interface TableFooter : UIView
@property(weak, nonatomic) id<TableFooterDelegate> delegate;
+(instancetype) tableFooterFromFile;

@end

NS_ASSUME_NONNULL_END
