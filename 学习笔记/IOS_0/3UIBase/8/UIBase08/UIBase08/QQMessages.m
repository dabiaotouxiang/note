//
//  QQMessages.m
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import "QQMessages.h"

@implementation QQMessages

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)messagesFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *messages = [NSMutableArray new];
    for (NSDictionary *dict in dictArray){
        [messages addObject:[self messageWithDict:dict]];
    }
    return messages;
}

@end
