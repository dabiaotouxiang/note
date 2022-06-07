//
//  LSBAppCell.m
//  AppManagement
//
//  Created by lsb on 2022/5/24.
//

#import "LSBAppCell.h"

@interface LSBAppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;


@end

@implementation LSBAppCell



- (void)setAppModel:(LSBAppModel *)appModel{
    _appModel = appModel;
    self.icon.image = [UIImage imageNamed:appModel.name];
    self.title.text = appModel.title;
    
    if ([self.delegate respondsToSelector:@selector(showLabel)]){
        [self.downloadBtn addTarget:self.delegate action:@selector(showLabel) forControlEvents:UIControlEventTouchUpInside];
    }
    self.downloadBtn.enabled = NO;
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
