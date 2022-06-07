1. 在项目中添加new group
    1. 我们要添加的是without folder的group，一定看好了。如果选项里面有 new group without folder 就选这个，如果有 new group with folder 就选new group
2. tableView
    1. 向数据源结尾添加一个数据
        ```
        [self.gBCellModels addObject:[GBCellModel gBCellModelWithDict:@{@"title": @"你好", @"price": @"0", @"icon": @"ad_00", @"buyCount": @"10"}]];
    
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.gBCellModels.count - 1 inSection:0];
        // 插入指定位置的row，前提是cellModels里面有，这里刚添加了一个
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        // 使指定的row的底部滚动到右侧的滚动条中的光标的顶部
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        ```
    2. 可以添加footerview 和headerview
        ```
        // 在viewdidload加载
        TableFooter *footer =[TableFooter tableFooterFromFile];
        self.tableView.tableFooterView = footer;
        
        self.tableView.tableHeaderView = [TableHeader tableHeaderFromFile];
        ```
3. model
    1。 从plist中读取数据应该写到model的类方法中来解耦
        ```
        + (NSMutableArray *)gBCellModelsFromFile{
            NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
            
            NSArray *cellModelDicts = [NSArray arrayWithContentsOfFile:path];
            
            NSMutableArray *array = [NSMutableArray new];
            
            for (NSDictionary *dict in cellModelDicts){
                [array addObject:[self gBCellModelWithDict:dict]];
            }
            return array;
        }
        ```
4. delegate
    1. 在原来类的header中进行delegate的声明
    2. 在原来的类的属性中添加
        ```
        // weak 避免循环引用
        @property(weak, nonatomic) id<自定义delegate名> delegate;
        ```
    3. 使用时把实现了delegate的类的对象传进来
5. main.storyboard里面删掉原来的viewcontroller换成自定义的需要把 Is Initial View Controller 钩上，说明这个controller是入口
6. xib文件
    1. xib对应的view文件中应该实现loadNib的方法，和调用者解耦
        ```
        +(instancetype)gBTableViewCellFromFile{
            return [[[NSBundle mainBundle] loadNibNamed:@"GBTableViewCell" owner:nil options:nil] firstObject];
        }
        ```
7. 自定义Cell
    1. 可以在创建CocoaClass文件的时候，选择继承UITableViewCell。并钩上创建xib文件
    2. 可以直接把cell的model作为属性添加到自定义的cell，并重写setter方法，赋值的时候给子控件赋值
        ```
        - (void)setCellModel:(GBCellModel *)cellModel{
            _cellModel = cellModel;
            self.icon.image = [UIImage imageNamed:cellModel.icon];
            self.title.text = cellModel.title;
            self.price.text = [NSString stringWithFormat:@"¥ %@", cellModel.price];
            self.buyCount.text = [NSString stringWithFormat:@"%@ 人已购买", cellModel.buyCount];
        }
        ```
    3. awakeFromNib 对象方法，用法相当于Xib的View的viewDidLoad，指nib文件刚加载的时候
        ```
        // 利用其特性在刚加载的时候给scroll里面的image赋值
        - (void)awakeFromNib{
            [super awakeFromNib];
            for (int i = 0; i < 5; i++){
                UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"ad_0%d", i]]];
                [self.scrollView addSubview:imgView];
                imgView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            }
            self.scrollView.pagingEnabled = YES;
            self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 5, self.scrollView.frame.size.height);
            self.scrollView.showsHorizontalScrollIndicator = NO;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        }
        ```
    4. 纯代码实现的tableViewCell，在使用reusableId的时候需要在tableView的viewDidLoad的时候进行注册  
        ```
        [self.tableView registerClass:[WBTableCell class] forCellReuseIdentifier:cellId];
        ```
    5. 纯代码向cell里面添加控件，要加到cell的contentView里
        ```
        // self 指自定义的cell的对象
        [self.contentView addSubview:imgView];
        ```
8. dispatch_after方法
    ```
    // 延时3秒运行代码块中的代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(loadMore)]){
            [self.delegate loadMore];
        }
        
        self.loadBtn.hidden = NO;
        self.loadView.hidden = YES;
    });
    ```
9. UILabel
    1. 设置换行
        ```
        label.numberOfLines = 0;
        ```
    2. 设置字体大小
        ```
        label.font = [UIFont systemFontOfSize:16];
        ```
    3. 设置字体颜色
        ```
        label.textColor = [UIColor orangeColor];
        ```
10. plist NSDictionary
    1. setValuesForKeysWithDictionary 对于类中有，文件中没有的key，会给属性赋默认值，比如0或者nil
    2. 当NSString类型的属性被赋值为nil的时候，可以通过属性.length == 0来判断从文件读出来的是否有值，属性是nil的时候，这句话不会报错，属性.length是0.也可以直接用 属性== nil来判断
11. Text的frame
    1. 对于Label的frame的判断可以用下面的方法
        ```
        UIFont *nameFont = [UIFont systemFontOfSize:14];
        // options:NSStringDrawingUsesLineFragmentOrigin 这个记住 
        // boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) 这分别限制width 和 height的最大值
        // attributes:@{NSFontAttributeName: nameFont} 这里的格式要记住 key为 NSFontAttributeName
        CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: nameFont} context:nil];
        // CGRectGetMaxX(_iconFrame)获取 iconFrame的x轴的最大值 还有 CGRectGetMaxY
        nameFrame.origin.x = CGRectGetMaxX(_iconFrame) + padding;
        nameFrame.origin.y = padding + (iconHeight - nameFrame.size.height) /2;
        _nameFrame = nameFrame;
        ```