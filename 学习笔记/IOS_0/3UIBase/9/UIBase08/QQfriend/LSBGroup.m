//
//  LSBGroup.m
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import "LSBGroup.h"
#import "LSBFriend.h"
@implementation LSBGroup

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        NSNumber *value = dict[@"online"];
        self.online = value.intValue;
        self.show = NO;
        NSArray *friendDicts = dict[@"friends"];
        
        NSMutableArray *friends = [NSMutableArray array];
        
        for (NSDictionary *friendDict in friendDicts){
            [friends addObject:[LSBFriend friendWithDict:friendDict]];
        }
        self.friends = friends;
    }
    return self;
}

+ (instancetype) groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)groupsFromFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    NSArray *groupDicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *groups = [NSMutableArray array];
    for (NSDictionary *groupDict in groupDicts){
        [groups addObject:[self groupWithDict:groupDict]];
    }
    
    return groups;
}

@end
