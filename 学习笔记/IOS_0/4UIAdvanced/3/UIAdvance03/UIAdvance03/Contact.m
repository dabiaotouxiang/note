//
//  Contact.m
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import "Contact.h"

@implementation Contact

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.number forKey:@"number"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.number = [coder decodeObjectForKey:@"number"];
    }
    return self;
}

@end
