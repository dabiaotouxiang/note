//
//  NSString+QQNSStringTool.m
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import "NSString+QQNSStringTool.h"

@implementation NSString (QQNSStringTool)

- (CGRect)textFrameWithFontSize:(CGSize)size WithFont:(UIFont *)font{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
}

@end
