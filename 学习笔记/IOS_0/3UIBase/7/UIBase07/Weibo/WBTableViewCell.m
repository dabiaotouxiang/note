//
//  WBTableViewCell.m
//  Weibo
//
//  Created by lsb on 2022/5/22.
//

#import "WBTableViewCell.h"

@interface WBTableViewCell ()

@property(nonatomic, weak) UIImageView *icon;

@property(nonatomic, weak) UILabel *name;

@property(nonatomic, weak) UIImageView *vip;

@property(nonatomic, weak) UILabel *textView;

@property(nonatomic, weak) UIImageView *picture;

-(void) settingData;

- (void) settingFrame;

@end

@implementation WBTableViewCell

- (UIImageView *)icon{
    if (_icon == nil) {
        UIImageView *icon = [UIImageView new];
        _icon = icon;
        [self.contentView addSubview:icon];
    }
    return _icon;
}

- (UILabel *)name{
    if (_name == nil) {
        UILabel *name = [UILabel new];
        name.font = [UIFont systemFontOfSize:14];
        _name = name;
        [self.contentView addSubview:name];
    }
    return _name;
}

- (UIImageView *)vip{
    if (_vip == nil) {
        UIImageView *vip = [UIImageView new];
        vip.hidden = YES;
        _vip = vip;
        [self.contentView addSubview:vip];
    }
    return _vip;
}

- (UILabel *)textView{
    if (_textView == nil) {
        UILabel *textView = [UILabel new];
        textView.font = [UIFont systemFontOfSize:16];
        textView.numberOfLines = 0;
        _textView = textView;
        [self.contentView addSubview:_textView];
    }
    return _textView;
}
- (UIImageView *)picture{
    if (_picture == nil) {
        UIImageView *picture = [UIImageView new];
        _picture = picture;
        [self.contentView addSubview:picture];
    }
    return _picture;
}


- (void)settingData{
    CellModel *cellModel = self.cellModelFrame.cellModel;
    self.icon.image = [UIImage imageNamed:cellModel.icon];
    
    self.name.text = cellModel.name;
    self.textView.text = cellModel.text;
    
    if (cellModel.vip){
        self.vip.image =[UIImage imageNamed:@"vip"];
        self.name.textColor = [UIColor orangeColor];
    }
    if (cellModel.picture.length > 0){
        self.picture.image =[UIImage imageNamed:cellModel.picture];
    }
}

- (void)settingFrame{
    self.icon.frame = self.cellModelFrame.iconFrame;
    
    self.name.frame = self.cellModelFrame.nameFrame;
    self.textView.frame = self.cellModelFrame.textFrame;
    self.vip.frame =self.cellModelFrame.vipFrame;
        self.picture.frame =self.cellModelFrame.pictureFrame;
}

- (void)setCellModelFrame:(CellModelFrame *) cellModelFrame{
    _cellModelFrame = cellModelFrame;
    [self settingData];
    [self settingFrame];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
