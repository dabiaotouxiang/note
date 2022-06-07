//
//  LSBHeaderView.m
//  QQfriend
//
//  Created by lsb on 2022/5/24.
//

#import "LSBHeaderView.h"

@interface LSBHeaderView ()
@property(nonatomic, weak) UIButton *button;
@property(nonatomic, weak) UILabel *label;

- (void) btnClick;
@end

@implementation LSBHeaderView

- (void)btnClick{
    self.group.show = !self.group.show;
    
    if ([self.delegate respondsToSelector:@selector(reloadGroupSection:)]){
        [self.delegate reloadGroupSection:self];
    }
    
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    if (self.group.show){
        self.button.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}

- (void)setGroup:(LSBGroup *)group{
    _group = group;
    [self.button setTitle:group.name forState:UIControlStateNormal];
    self.label.text = [NSString stringWithFormat:@"%d/%lu", group.online, group.friends.count];
    self.button.imageView.transform =CGAffineTransformMakeRotation(0);
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    UIButton *button = [UIButton new];
    [button setBackgroundImage: [UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    [button setBackgroundImage: [UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
    
    [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleEdgeInsets =UIEdgeInsetsMake(0, 5, 0, 0);
    button.imageView.contentMode = UIViewContentModeCenter;
    button.imageView.clipsToBounds = NO;
    [self.contentView addSubview:button];
    self.button = button;
    [self.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [UILabel new];
    [self.contentView addSubview:label];
    self.label = label;
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.label.frame = CGRectMake(self.frame.size.width - 70, 5, 60, 40);
}

+ (instancetype)headerReusedWithTableView:(UITableView *)tableView{
    static NSString *headerId = @"headerId";
    id header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerId];
    if (header == nil){
        return [[self alloc] initWithReuseIdentifier:headerId];
    }
    return header;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
