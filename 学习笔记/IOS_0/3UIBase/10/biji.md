1. autolayout 代码实现
    1. 禁止 translatesAutoresizingMaskIntoConstraints
        ```
        blueView.translatesAutoresizingMaskIntoConstraints = NO;
        ```
    2. 保证已经添加至父控件
        ```
        [self.view addSubview:blueView];
        ```
    3. 千万不要设置frame
    4. NSLayoutConstraint 创建具体的约束对象
        ```
        // 第一个是被约束的对象 第一个attribute是 对象的约束部分 第三个是关系 等于 第四个是关系对象 第五个是关系对象的对应部分 第六个是对应部分乘几 第七个是乘之后加几 
        NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:obj1 attribute:attr1 relatedBy:NSLayoutRelationEqual toItem:obj2 attribute:attr2 multiplier:0 constant:50];

        // obj1.attr1 = obj2.attr2 * multiplier + constant
        ```
    5. 添加到view中
        1. 如果是本身单个obj，就
            ```
            NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:50];
    [blueView addConstraint:blueHeight];
            ```
        2. 如果是两个obj，就加到父控件
            ```
            NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    [self.view addConstraint:blueTop];
            ```
2. layout实现动画
    1. 点击事件改变layout
        ```
        // 改变后立刻显示
        self.view.constant += 100;
        // 省略了 [self.view layoutIfNeeded]
        ```
    2. 添加动画效果
        ```
        // 把省略的加进动画的代码块中
        self.view.constant += 100;
        [UIView animateWithDuration: 1.5 animations:^{ [self.view layoutIfNeeded] }];
        ```
    