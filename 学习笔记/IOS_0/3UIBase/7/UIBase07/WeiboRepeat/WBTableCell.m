//
//  WBTableCell.m
//  WeiboRepeat
//
//  Created by lsb on 2022/5/22.
//

#import "WBTableCell.h"

@interface WBTableCell ()

@property(weak, nonatomic) UIImageView *icon;
@property(weak, nonatomic) UILabel *name;
@property(weak, nonatomic) UIImageView *vip;
@property(weak, nonatomic) UILabel *textView;
@property(weak, nonatomic) UIImageView *picture;

-(void) settingData;
-(void) settingFrame;

@end

@implementation WBTableCell

- (UIImageView *)icon{
    if (_icon == nil){
        UIImageView *imgView = [UIImageView new];
        _icon = imgView;
        [self.contentView addSubview:imgView];
    }
    return _icon;
}

- (UILabel *)name{
    if (_name == nil){
        UILabel *name = [UILabel new];
        name.font = [UIFont systemFontOfSize:14];
        _name = name;
        [self.contentView addSubview:name];
    }
    return _name;
}

- (UIImageView *)vip{
    if (_vip ==nil) {
        UIImageView *vip = [UIImageView new];
        _vip = vip;
        [self.contentView addSubview:vip];
    }
    return _vip;
}

- (UILabel *)textView{
    if (_textView == nil){
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 0;
        _textView = label;
        [self.contentView addSubview:label];
    }
    return _textView;
}

- (UIImageView *)picture{
    if (_picture == nil){
        UIImageView *picture = [UIImageView new];
        _picture = picture;
        [self.contentView addSubview:picture];
    }
    return _picture;
}

- (void)settingData{
    self.icon.image = [UIImage imageNamed:self.statusFrame.status.icon];
    self.name.text = self.statusFrame.status.name;
    if (self.statusFrame.status.isVip){
        self.vip.image = [UIImage imageNamed:@"vip"];
        self.name.textColor = [UIColor orangeColor];
    }
    self.textView.text = self.statusFrame.status.text;
    if (self.statusFrame.status.picture != nil){
        self.picture.image = [UIImage imageNamed:self.statusFrame.status.picture];
    }
}

- (void)settingFrame{
    self.icon.frame = self.statusFrame.iconFrame;
    self.name.frame = self.statusFrame.nameFrame;
    self.vip.frame = self.statusFrame.vipFrame;
    self.textView.frame = self.statusFrame.textFrame;
    self.picture.frame = self.statusFrame.pictureFrame;
}

- (void)setStatusFrame:(WBStatusFrames *)statusFrame{
    _statusFrame = statusFrame;
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
