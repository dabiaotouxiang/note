//
//  QQTableViewCell.m
//  UIBase08
//
//  Created by lsb on 2022/5/23.
//

#import "QQTableViewCell.h"

@interface QQTableViewCell ()

@property(nonatomic, weak) UILabel *timeLbl;
@property(nonatomic, weak) UIImageView *iconImg;
@property(nonatomic, weak) UIButton *textBtn;

@end

@implementation QQTableViewCell

- (void)setMessageFrame:(QQMessageFrame *)messageFrame{
    _messageFrame = messageFrame;
    
    QQMessages *message = messageFrame.message;
    
    self.timeLbl.text = message.time;
    self.timeLbl.frame = messageFrame.timeFrame;
    
    
    UIImage *imgnor, *imgpress;
    if (message.type){
        self.iconImg.image = [UIImage imageNamed:@"Jobs"];
        
        imgnor = [UIImage imageNamed:@"chat_recive_nor"];
        imgpress = [UIImage imageNamed:@"chat_recive_press_pic"];
    }else{
        self.iconImg.image = [UIImage imageNamed:@"Gatsby"];
        imgnor = [UIImage imageNamed:@"chat_send_nor"];
        imgpress = [UIImage imageNamed:@"chat_send_press_pic"];
    }
    self.iconImg.frame = messageFrame.iconFrame;
    imgnor = [imgnor stretchableImageWithLeftCapWidth:imgnor.size.width * 0.5 topCapHeight:imgnor.size.height * 0.5];
    imgpress =[imgpress stretchableImageWithLeftCapWidth:imgpress.size.width * 0.5 topCapHeight:imgpress.size.height * 0.5];
    [self.textBtn setTitle:message.text forState:UIControlStateNormal];
    [self.textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    NSLog(@"%@", message.text);
    
    [self.textBtn setBackgroundImage:imgnor forState:UIControlStateNormal];
    [self.textBtn setBackgroundImage:imgpress forState:UIControlStateHighlighted];
    self.textBtn.frame = messageFrame.textFrame;
    self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
//    UIButtonConfiguration *btnconf = [UIButtonConfiguration u];
//    [btnconf setContentInsets:NSDirectionalEdgeInsetsMake(15, 20, 15, 20)];
//    self.textBtn.configuration.contentInsets = NSDirectionalEdgeInsetsMake(15, 20, 15, 20);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel *timeLabel = [UILabel new];
        [self.contentView addSubview:timeLabel];
        self.timeLbl = timeLabel;
        self.timeLbl.textAlignment = NSTextAlignmentCenter;
        self.timeLbl.font = [UIFont systemFontOfSize:13];
        
        UIImageView *iconImg = [UIImageView new];
        [self.contentView addSubview:iconImg];
        self.iconImg = iconImg;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:button];
        self.textBtn = button;
        self.textBtn.titleLabel.font =[UIFont systemFontOfSize:13];
        self.textBtn.titleLabel.numberOfLines = 0;
        
        self.backgroundColor =[UIColor clearColor];
    }
    return self;
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
