//
//  CellModelFrame.m
//  Weibo
//
//  Created by lsb on 2022/5/22.
//

#import "CellModelFrame.h"

/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@implementation CellModelFrame

- (instancetype)initWithCellModel:(CellModel *)cellModel{
    if (self = [super init]) {
        self.cellModel = cellModel;
    }
    return self;
}

+ (instancetype)cellModelFrameWithCellModel:(CellModel *)cellModel{
    return [[self alloc] initWithCellModel:cellModel];
}

+ (NSArray *)cellModelFramesFromFile{
    NSArray *cellModels = [CellModel cellModelsFromFile];
    
    NSMutableArray *cellModelFrames = [NSMutableArray new];
    
    for (CellModel *cellModel in cellModels){
        [cellModelFrames addObject: [self cellModelFrameWithCellModel:cellModel]];
    }
    return cellModelFrames;
}

- (void)setCellModel:(CellModel *)cellModel{
    _cellModel = cellModel;
    
    CGFloat padding = 10;
    CGFloat iconWidth = 40;
    CGFloat iconHeight = 40;
    _iconFrame = CGRectMake(padding, padding, iconWidth, iconHeight);
    
    NSDictionary *nameDict = @{NSFontAttributeName: kNameFont};
    //    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    CGRect nameFrame = [self.cellModel.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconFrame) + padding;
    nameFrame.origin.y = padding + (self.iconFrame.size.height - nameFrame.size.height) * 0.5;
    _nameFrame = nameFrame;
    
    // vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameFrame) + padding;
    CGFloat vipY = self.nameFrame.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文
    NSDictionary *textDict = @{NSFontAttributeName: kTextFont};
    //    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    CGRect textFrame = [self.cellModel.text boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconFrame) + padding;
    _textFrame = textFrame;
    
    if (self.cellModel.picture.length > 0) {
        // 配图
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        _cellHeight = CGRectGetMaxY(self.pictureFrame) + padding;
    } else {
        _cellHeight = CGRectGetMaxY(self.textFrame) + padding;
    }
    
}

@end
