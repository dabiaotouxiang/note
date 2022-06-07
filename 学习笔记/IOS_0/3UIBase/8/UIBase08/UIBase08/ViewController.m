//
//  ViewController.m
//  UIBase08
//
//  Created by lsb on 2022/5/22.
//

#import "ViewController.h"
#import "QQTableViewCell.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITextField *fieldView;

-(void)keyboardOriginChange:(NSNotification *) keyBoardNotification;

-(void)sendMessage:(NSString* )str;

@end

@implementation ViewController

- (void)sendMessage:(NSString *)str{
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"今天 HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    QQMessages *message = [QQMessages messageWithDict:@{@"text": str, @"time": time, @"type": @0}];
    QQMessageFrame *messageFrame = [QQMessageFrame new];
    messageFrame.message = message;
    [self.messageFrames addObject:messageFrame];
    
    QQMessages *messageOther = [QQMessages messageWithDict:@{@"text": @"你走", @"time": time, @"type": @1}];
    QQMessageFrame *messageFrameOther = [QQMessageFrame new];
    messageFrameOther.hidenTime = YES;
    messageFrameOther.message = messageOther;
    [self.messageFrames addObject:messageFrameOther];
    
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    //    self.messageFrames
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *messageStr = textField.text;
    if (messageStr.length != 0){
        textField.text = @"";
        [self sendMessage:messageStr];
    }
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//}

- (NSMutableArray *)messageFrames{
    if (_messageFrames == nil){
        NSArray *messages = [QQMessages messagesFromFile];
        NSMutableArray *messageFrames =[NSMutableArray new];
        for (int i = 0; i < messages.count; i ++){
            QQMessageFrame *messageFrame = [QQMessageFrame new];
            QQMessages *currentMessage = messages[i];
            if (i > 0){
                QQMessages *previousMessage = messages[i -1];
                if ([currentMessage.time isEqualToString:previousMessage.time]){
                    messageFrame.hidenTime = YES;
                }
            }
            messageFrame.message = currentMessage;
            [messageFrames addObject: messageFrame];
        }
        _messageFrames = messageFrames;
    }
    return _messageFrames;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"111";
    QQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[QQTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QQMessageFrame *messageFrame =self.messageFrames[indexPath.row];
    return messageFrame.cellHeight;
}

- (void)keyboardOriginChange:(NSNotification *)keyBoardNotification{
//    NSLog(@"%@", keyBoardNotification.userInfo);
    NSValue *keyboardEndRect =keyBoardNotification.userInfo[@"UIKeyboardFrameEndUserInfoKey"];
    
    CGFloat y =keyboardEndRect.CGRectValue.origin.y - self.view.frame.size.height;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, y);
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:236 /255.0 green:236 /255.0 blue:236 /255.0 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 只能这么设置，在storyboard中设置会看不到
    self.fieldView.background = [UIImage imageNamed:@"chat_bottom_textfield"];
    
    UIView *leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, 10, self.fieldView.frame.size.height);
    self.fieldView.leftView = leftView;
    self.fieldView.leftViewMode = UITextFieldViewModeAlways;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardOriginChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    // Do any additional setup after loading the view.
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
