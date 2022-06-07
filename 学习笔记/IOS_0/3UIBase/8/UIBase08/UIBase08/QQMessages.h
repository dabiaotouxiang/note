//
//  QQMessages.h
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    QQUserTypeMe,
    QQUserTypeOther
} QQUserType;

@interface QQMessages : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, assign) QQUserType type;

-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype) messageWithDict:(NSDictionary *) dict;

+(NSMutableArray *) messagesFromFile;

@end

NS_ASSUME_NONNULL_END
