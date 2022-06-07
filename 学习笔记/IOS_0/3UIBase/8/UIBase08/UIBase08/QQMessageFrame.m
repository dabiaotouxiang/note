//
//  QQMessageFrame.m
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import "QQMessageFrame.h"
#import "NSString+QQNSStringTool.h"
#define timeFont [UIFont systemFontOfSize:13]
#define textFont [UIFont systemFontOfSize:15]
@implementation QQMessageFrame

- (void)setMessage:(QQMessages *)message{
    _message = message;
    
    CGFloat padding = 10;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (!_hidenTime){
        
        CGRect timeFrame = [message.time textFrameWithFontSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) WithFont:timeFont];
        CGFloat timeX = (screenSize.width - timeFrame.size.width) / 2;
        _timeFrame = CGRectMake(timeX, padding, timeFrame.size.width, timeFrame.size.height);
    }
    CGFloat iconWidth = 50;
    CGFloat iconHeight = 50; CGFloat textMaxWidth = screenSize.width - iconWidth * 2 - padding * 4;
    CGRect textFrame = [message.text textFrameWithFontSize:CGSizeMake(textMaxWidth - 40, CGFLOAT_MAX) WithFont:textFont];
    if (message.type){
        _iconFrame = CGRectMake(padding, CGRectGetMaxY(_timeFrame) + padding, iconWidth, iconHeight);
        _textFrame = CGRectMake(CGRectGetMaxX(_iconFrame) + padding, CGRectGetMaxY(_timeFrame) + padding, textFrame.size.width + 40, textFrame.size.height + 30);
        
    }else{
        _iconFrame = CGRectMake(screenSize.width - padding - iconWidth, CGRectGetMaxY(_timeFrame) + padding, iconWidth, iconHeight);
        _textFrame = CGRectMake(CGRectGetMinX(_iconFrame) - padding - textFrame.size.width - 40, CGRectGetMaxY(_timeFrame) + padding, textFrame.size.width + 40, textFrame.size.height + 30);
    }

   
    _cellHeight = CGRectGetMaxY(_textFrame) > CGRectGetMaxY(_iconFrame) ? CGRectGetMaxY(_textFrame) + padding : CGRectGetMaxY(_iconFrame) + padding;
}

@end
