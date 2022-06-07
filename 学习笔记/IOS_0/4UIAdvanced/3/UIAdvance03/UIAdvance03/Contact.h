//
//  Contact.h
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject <NSCoding>
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *number;
@end

NS_ASSUME_NONNULL_END
