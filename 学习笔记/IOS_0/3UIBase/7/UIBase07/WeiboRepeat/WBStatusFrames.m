//
//  WBStatusFrames.m
//  WeiboRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "WBStatusFrames.h"
#define WBnameFont [UIFont systemFontOfSize:14]
#define WBTextFont [UIFont systemFontOfSize:16]
@implementation WBStatusFrames

- (void)setStatus:(WBStatus *)status{
    _status = status;
    
    CGFloat padding = 10;
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconWidth = 40;
    CGFloat iconHeight = 40;
    
    _iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    UIFont *nameFont = WBnameFont;
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: nameFont} context:nil];
    nameFrame.origin.x = CGRectGetMaxX(_iconFrame) + padding;
    nameFrame.origin.y = padding + (iconHeight - nameFrame.size.height) /2;
    _nameFrame = nameFrame;
    
    CGFloat vipWidth = 14;
    CGFloat vipHeight = 14;
    CGRect vipFrame = CGRectMake(CGRectGetMaxX(self.nameFrame) + padding, padding + (iconHeight - vipHeight) /2, vipWidth, vipHeight);
    
    _vipFrame =vipFrame;
    
    
    UIFont *textFont = WBTextFont;
    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(355, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: textFont} context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(_iconFrame) + padding;
    _textFrame = textFrame;
    
    if (self.status.picture.length > 0){
        CGFloat pictureWidth = 100;
        CGFloat pictureHeight = 100;
        
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureHeight);
        
        _cellHeight = CGRectGetMaxY(_pictureFrame) + padding;
    }else{
        _cellHeight = CGRectGetMaxY(_textFrame) + padding;
    }
    
}

- (instancetype)initWithStatus:(WBStatus *)status{
    if (self = [super init]){
        self.status = status;
    }
    return self;
}

+ (instancetype)statusFrameWithStatus:(WBStatus *)status{
    return [[self alloc] initWithStatus:status];
}

+ (NSArray *)statusFramesWithStatuses:(NSArray *)statusModels{
    NSMutableArray *frames = [NSMutableArray new];
    for (WBStatus *status in statusModels){
        [frames addObject:[self statusFrameWithStatus:status]];
    }
    return frames;
}

@end
