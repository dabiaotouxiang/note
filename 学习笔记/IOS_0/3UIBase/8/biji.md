1. TextFieldView
    1. 切换键盘的return键为其他键 在storyboard的return key里面进行选择
    2. 点击textField召唤出的keyboard的return或者send按钮，对其进行处理
        1. 实现UITextFieldDelegate
        2. 拉线
        3. 实现 textFieldShouldReturn 方法
    3. 键盘撤回 `[self.view endEditing:YES];`
    4. 输入框设置无边框后，光标靠最右了，可以这么设置，让光标不那么靠左
        ```
        UIView *leftView = [UIView new];
        leftView.frame = CGRectMake(0, 0, 10, self.fieldView.frame.size.height);
        self.fieldView.leftView = leftView;
        self.fieldView.leftViewMode = UITextFieldViewModeAlways;
        ```
2. Notifiacation消息机制
    1. keyboard消息
        1. 接收keyboard消息 `[[NSNotificationCenter defaultCenter] addObserver:<#(nonnull id)#> selector:<#(nonnull SEL)#> name:<#(nullable NSNotificationName)#> object:<#(nullable id)#>]`;
        2. addObserver 是添加监听消息的对象
        3. selector 是对象中负责监听消息的方法
        4. name 监听的消息的名称
        5. object 是监听的对象
        6. name和object可以有一个为nil，两个都为nil就接收所有的消息
    2. 监听消息的方法
        ```
        // 监听 UIKeyboardWillChangeFrameNotification 键盘的位置变化 根据键盘的位置变化去把view的位置变动防止键盘挡住view
        // useinfo是传递的消息
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
        ```
    3. 消息的发布 
        1. 获取center对象 `NSNotificationCenter *center = [NSNotificationCenter defaultCenter];`
        2. 发布消息 `center postNotificationXXX:... object:发布者对象 userInfo: NSDictionary对象给监听者的消息 `
    4. 监听对象回收的时候必须移除监听对象
3. 设置tableView的背景色 `self.tableView.backgroundColor = [UIColor colorWithRed:236 /255.0 green:236 /255.0 blue:236 /255.0 alpha:1];`
    1. 背景色会被cell挡住，要设置cell的颜色为 `self.backgroundColor =[UIColor clearColor];` self指cell
4. 设置聊天框的背景图 
    ```
    imgnor = [UIImage imageNamed:@"chat_send_nor"];
    imgpress = [UIImage imageNamed:@"chat_send_press_pic"];
    // 设置图片可以延伸，延伸的标准是从图片中央延伸
    imgnor = [imgnor stretchableImageWithLeftCapWidth:imgnor.size.width * 0.5 topCapHeight:imgnor.size.height * 0.5];
    imgpress =[imgpress stretchableImageWithLeftCapWidth:imgpress.size.width * 0.5 topCapHeight:imgpress.size.height * 0.5];
    [self.textBtn setBackgroundImage:imgnor forState:UIControlStateNormal];
    [self.textBtn setBackgroundImage:imgpress forState:UIControlStateHighlighted];

    // 设置聊天内容和内容的颜色
    [self.textBtn setTitle:message.text forState:UIControlStateNormal];
    [self.textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置内边距，让文字出现在北京图片内
    self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
    ```
5. 让聊天框的文字包含在背景图片中
    0. 聊天框用button做
    1. 让图片可以拉伸 
        ```
        imgpress = [UIImage imageNamed:@"chat_send_press_pic"];
        imgnor = [imgnor stretchableImageWithLeftCapWidth:imgnor.size.width * 0.5 topCapHeight:imgnor.size.height * 0.5];
        ```
    2. 让button的大小为计算出的文件的frame再加上内边距的大小
        ```
        CGRectMake(CGRectGetMaxX(_iconFrame) + padding, CGRectGetMaxY(_timeFrame) + padding, textFrame.size.width + 40, textFrame.size.height + 30);
        ```
    3. 文字的实际大小要比计算时的大小小一些
    4. 设置内边距 `self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);`
