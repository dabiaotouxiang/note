//
//  ViewController.m
//  UIBase04
//
//  Created by lsb on 2022/5/18.
//

#import "ViewController.h"

#import "Question.h"

@interface ViewController ()

@property(nonatomic, strong)NSArray *quertions;
@property(nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
@property (weak, nonatomic) IBOutlet UIButton *coinBtn;
@property (weak, nonatomic) IBOutlet UIImageView *answerView;
@property (weak, nonatomic) IBOutlet UIImageView *optionsView;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@property (weak, nonatomic) UIButton *cover;

@property (assign, nonatomic) CGRect btnIconFrame;

@property(nonatomic, assign) int coin;

- (IBAction)btnIconClick;
- (IBAction)btnTipClick;
- (IBAction)imgBtnClick;
- (IBAction)btnNextClick;
- (void)next;
- (void)smallIcon;
- (void) optionBtnClick:(UIButton *) sender;
- (void) answerBtnClick:(UIButton *) sender;
@end

@implementation ViewController

- (NSArray *)quertions{
    if (_quertions == nil){
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"]];
        
        NSMutableArray *objArray = [NSMutableArray new];
        
        for (int i = 0; i < array.count ; i++){
            [objArray addObject:[Question questionWithDict:array[i]]];
        }
        _quertions = objArray;
        
    }
    return _quertions;
}

// 修改状态栏的颜色为浅色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = -1;
    self.coin = 10000;
    [self btnNextClick];
    // Do any additional setup after loading the view.
}


// 点击下一题
- (IBAction)btnNextClick {
    self.index++;
    [self next];
}

//缩小图片
- (void)smallIcon{
    
    [UIView animateWithDuration:1 animations:^{
            [self.cover removeFromSuperview];
            self.btnIcon.frame = self.btnIconFrame;
            
    }];
}

// 放大图片
- (IBAction)imgBtnClick {
    UIButton *cover = [UIButton new];
    self.cover = cover;
    [self.view addSubview:cover];
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    cover.alpha = 0;
    
    [cover addTarget:self action:@selector(smallIcon) forControlEvents:UIControlEventTouchUpInside];
    self.btnIconFrame = self.btnIcon.frame;
    [UIView animateWithDuration:1 animations:^{
            cover.alpha = 0.6;
        [self.view bringSubviewToFront:self.btnIcon];
        self.btnIcon.frame = CGRectMake(0, (self.view.frame.size.height - self.view.frame.size.width)/2, self.view.frame.size.width, self.view.frame.size.width);
    }];
    
}

// 点击提示
- (IBAction)btnTipClick {
    [self.answerView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
        [self answerBtnClick:obj];
    }];
    Question *question = self.quertions[self.index];
    NSString *firstCh = [question.answer substringToIndex:1];
    [self.optionsView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
        if ([[obj titleForState:UIControlStateNormal]  isEqualToString:firstCh]){
            [self optionBtnClick:obj];
            self.coin -= 1000;
            [self.coinBtn setTitle:[NSString stringWithFormat:@"%d", self.coin] forState:UIControlStateNormal];
            *stop = YES;
        }
    }];
}

// 点击图片
- (IBAction)btnIconClick {
    // 当图片缩小时，cover从父控件移除，在当前controller中是weak，不再有强链接，自动移除，controller中的cover属性自动赋值为nil
    if (self.cover == nil){
        [self imgBtnClick];
    }else{
        [self smallIcon];
    }
}

// 点击答案框
- (void)answerBtnClick:(UIButton *)sender{
    [sender setTitle:nil forState:UIControlStateNormal];
    UIButton *optionView = self.optionsView.subviews[sender.tag];
    optionView.hidden = NO;
    [self.answerView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
        [obj setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }];
    [self.optionsView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
        obj.enabled = YES;
    }];
}

// 点击选项
- (void)optionBtnClick:(UIButton *)sender{
    NSMutableString *myAnswer = [NSMutableString new];
    for (int i = 0; i < self.answerView.subviews.count ; i ++){
        UIButton *answerBtn = self.answerView.subviews[i];
//        NSLog(@"%@", answerBtn.currentTitle);
        if ([answerBtn titleForState:UIControlStateNormal] == NULL){
            answerBtn.tag = sender.tag;
            [answerBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
            [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            sender.hidden = YES;
            break;
        }
    }
    
    [self.answerView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
        if ([obj titleForState:UIControlStateNormal]){
        [myAnswer appendString: [obj titleForState:UIControlStateNormal]];
        }
    }];
    
    BOOL isFull = myAnswer.length == self.answerView.subviews.count;
    if (isFull){
        [self.optionsView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
            obj.enabled = NO;
        }];
        Question *quesion = self.quertions[self.index];
        if ([myAnswer isEqualToString:quesion.answer]){
            [self.answerView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
                [obj setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }];
            [UIView animateWithDuration:0.5 animations:^{
                self.coin += 500;
                if (self.index + 1 < self.quertions.count){
                    [self btnNextClick];
                }else{
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"恭喜过关" message:@"恭喜恭喜" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action) {
                        self.index = -1;
                        self.coin = 10000;
                        [self btnNextClick];
                    }];
                    [alertController addAction:defaultAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                }
            }];
        }else{
            [self.answerView.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger index, BOOL *stop){
                [obj setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }];
        }
    }
}

// 下一张图片
- (void)next{
    // 显示金币
    [self.coinBtn setTitle:[NSString stringWithFormat:@"%d", self.coin] forState:UIControlStateNormal];
    // 显示index
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%lu", self.index + 1, self.quertions.count];
    Question *quesion = self.quertions[self.index];
    // 显示标题
    self.titleLabel.text = quesion.title;
    // 显示图片
    UIImage *image = [UIImage imageNamed: quesion.icon];
    [self.btnIcon setImage: image forState:UIControlStateNormal];
    // 下一张是否可以点击
    self.btnNext.enabled = (self.index + 1) != self.quertions.count;
    
    // 将适当个数的答案框摆在answerView
    // 设置框的大小 宽高都为44.
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat width = 44;
    CGFloat height = 44;
    CGFloat margin = 10;
    CGFloat marginX = (self.view.frame.size.width - width * quesion.answer.length - margin * (quesion.answer.length - 1)) / 2;
    
    
    for (int i = 0; i < quesion.answer.length ; i++){
        UIButton *answerBtn = [UIButton new];
        [self.answerView addSubview:answerBtn];
        answerBtn.frame = CGRectMake(marginX + (width + margin) * i, 0, width, height);
        UIImage *btn_answer = [UIImage imageNamed:@"btn_answer"];
        [answerBtn setBackgroundImage:btn_answer forState:UIControlStateNormal];
        UIImage *btn_answer_highlighted = [UIImage imageNamed:@"btn_answer_highlighted"];
        [answerBtn setBackgroundImage:btn_answer_highlighted forState:UIControlStateHighlighted];
        
        [answerBtn addTarget:self action:@selector(answerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    // 将适当个数的options框摆在optionsView
    // 设置框的大小 宽高都为44.
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int numInLine = 7;
    width = 44;
    height = 44;
    margin = 5;
    marginX = (self.view.frame.size.width - width * numInLine - margin * (numInLine - 1)) / 2;
    
    
    for (int i = 0; i < quesion.options.count ; i++){
        UIButton *optionBtn = [UIButton new];
        [self.optionsView addSubview:optionBtn];
        optionBtn.tag = i;
        optionBtn.frame = CGRectMake(marginX + (width + margin) * (i % numInLine), (i / 7) * (height + margin), width, height);
        UIImage *btn_option = [UIImage imageNamed:@"btn_option"];
        [optionBtn setBackgroundImage:btn_option forState:UIControlStateNormal];
        UIImage *btn_option_highlighted = [UIImage imageNamed:@"btn_option_highlighted"];
        [optionBtn setBackgroundImage:btn_option_highlighted forState:UIControlStateHighlighted];
        
        [optionBtn setTitle:quesion.options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [optionBtn addTarget:self action:@selector(optionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
@end
