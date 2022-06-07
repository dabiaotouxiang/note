//
//  AddViewController.h
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import <UIKit/UIKit.h>
@class AddViewController;
NS_ASSUME_NONNULL_BEGIN

@protocol AddViewControllerDelegate <NSObject>

- (void) addContactWithController:(AddViewController *) controller andName:(NSString *) name andNumber:(NSString *) number;

@end

@interface AddViewController : UIViewController

@property(nonatomic, weak) id<AddViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
