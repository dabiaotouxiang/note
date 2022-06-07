1. datePicker
    1. 设置过程
        ```
        UIDatePicker *datePicker = [UIDatePicker new];
        // 设置样式
        [datePicker setPreferredDatePickerStyle:UIDatePickerStyleWheels];
        // 设置语言
        [datePicker setLocale: [NSLocale localeWithLocaleIdentifier:@"zh-hans"] ];
        ```
    2. 一般用于TextField
        ```
        self.textField.inputView = datePicker;
        ```
2. TextFieldView
    1. 添加键盘最上层的确定或者取消之类的小工具
        ```
        UIToolbar *toolBar = [UIToolbar new];
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtn)];
        
        UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *sure = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureBtn)];
        
        toolBar.items = @[cancel, fixItem, sure];
        toolBar.bounds = CGRectMake(0, 0, 0, 50);
        self.inputField.inputAccessoryView = toolBar;
        ```
3. 获取info.plist文件
    ```
    [NSBundle mainBundle].infoDictionary;
    ```
4. UIApplication对象
    1. 显示消息数字
        ```
        UIApplication *app = [UIApplication sharedApplication];

        UIUserNotificationCategory *category = [[UIUserNotificationCategory alloc] init]:
        NSSet *set = INSet setWithobject: categoryl;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadgecategories:setl;
        [app registerUserNotificationSettings:settingsl;

        app.applicationIconBadgeNumber = 10;
        ```
    2. 联网状态指示器
        ```
        app.networkActivityIndicatorVisible = YES;
        ```
    3. app的状态栏的管理
        ```
        app.statusBarHidden = YES;
        ```