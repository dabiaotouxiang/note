1. UIApplication 
    1. 获取application对象 `UIApplication *app = [UIApplication sharedApplication];`
    2. 获取主界面 `app.keyWindow;`
    3. 获取所有界面 `app.windows;`
2. AppDelegate
    1. UIApplicationMain是在main文件中，是整个app程序的入口，里面是一个运行循环
3. app启动过程
    1. 入口 main的main函数
        1. main中的autoreleasepool
        2. 执行UIApplicationMain 不返回，保证程序不会被销毁
        3. 参数的第三个nil 相当于默认选择了@"UIApplication" 这个类名
        4. 参数的第四个 NSStringFromClass([AppDelegate class]) 获取App代理对象的类名，并作为上一个Application类生成的对象的代理
        5. 将代理对象的window实例化，并作为应用程序的keyWindow
        6. 加载配置文件(info.plist)中指定的storyboard的initial的controller
4. 应用程序的代理方法(实现UIApplication的协议)
    1. didFinishLaunchingWithOptions 加载完毕，可以添加自定义操作
    2. applicationWithResignActive 变为不活跃状态 (失去焦点)
    3. applicationDidEnterBackground 进入后台
    4. applicationWithEnterForeground 前台
    5. applicationDidBecomeActive 已经变得活跃 获取焦点
    6. applicationWillTerminate 将销毁
    7. applicationDidReceiveMemoryWarning 内存警告

5. 加载自定义的控制器
    1. viewController.h/.m main.storyboard删除
    2. info.plist中的stotyboard的name删除
    3. 加载自定义
        1. 在 AppDelegate 里面的didFinishLaunchingWithOptions
        2. 创建窗口，指定大小，赋值给 self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen].bounds]];
        3. 创建controller，设为窗口的根controller self.window.rootViewController = [[UIViewController alloc] init];
        4. 将这个Window作为keyWindow并设置为可见。 [self.window makeKeyAndVisible];
    4. view的懒加载
        1. controller中的 loadView方法 代表加载了view
        2. 在[self.window makeKeyAndVisible]; 的时候调用
        3. 或者是第一次调用view的时候加载
            ```
            // 在这调用了view view就已经加载了
            controller.view.backgroudColor = [UIColor blueColor];
            [self.window makeKeyAndVisible];
            ```

6. UIWindow 默认隐藏 创建的步骤和UIView差不多，继承自UIView
    1. 什么时候用UIWindow，在使用第三方的框架的时候，比如提示类的第三方框架
7. 加载控制器的三种方法
    1. 比如第三步的纯代码
    2. storyboard创建
        1. 创建storyboard文件
        2. 加载storyboard文件中的控制器
            1. 加载storyboard文件 `UIStoryboard *board = [[UIStoryboard storyboardWithName:@"xxxx"] bundle:nil]`
            2. 实例化storyboard中的控制器`UIViewController *hmVc = [board instantiateInitialViewController] `
            3. 或者用storyboardID  `UIViewControler *con = [board instantiateViewControllerWithIdentifier: @"xxxxx"];`
    3. 用xib创建
        1. 自定义controller类
        2. 指定xib文件
        3. 例子1 xib名称与controller类的名称一点关系没有
            1. 修改Xib的FileOwner为自定义Controller类，然后view指向xib中的view
            2. HMViewController *xibVc = [[HMViewController alloc] initWithNibName:@"xxxx" bundle:nil];
            3. self.window.rootWindowController = xibVc;
        4. 例子2   xib名称与controller类的名称一致
            1. [[HMViewController alloc] init]; 就不需要指名
        5. 例子2   xib名称XXXX.xib与controller类的名称 XXXXController.h类似
8. 导航控制器的使用
    1. 返回上一个控制器 `[self.navigationController popViewControllerAnimated:YES];` 在当前控制器对象中
    2. 返回到根控制器 `[self.navigationController popToRootViewControllerAnimated:YES];`在当前控制器对象中
    3. 返回到指定的控制器
        ```
        // 获取所有的控制器
        NSArray *vcs = self.navigationController.viewControllers;
        UIViewController *VC = vcs [1] :
        [self.navigationController popToViewController:VC animated: YES];
        ```
    4. 注意事项
        1. 创建控制器的同时指定它的根控制器
        2. 显示下一个控制的时候
            1. 创建一个push到的控制器
            2. push的时候，在当前控制器获取到导航控制器才行
        3. 返回
            1. 返回上一个控制 popViewControllerAnimated
            2. 返回根 popToRootViewControllerAnimated
            3. 返回指定的 popToViewController:VC animated: YES
    5. 导航控制器的导航栏 
        1. 设置title `self.navigationItem.title = @"红色控制器";`
        2. 设置title为控件
            ```
            UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [addBtn addTarget:self action:@selector(addBtnClick
            ) forControlEvents:UIControlEventTouchUpInsidel;
            self.navigationItem.titleView = addBtn;
            ```
        3. 设置左右边的按钮
            ```
            UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemStyle:UIBarButtonSystemItem Camera target:self action:@selector(xxx)];
            self.navigationItem.leftBarButtonItem = left;

            self.navigationItem.rightBarButtonItem = left;
            ```
        4. 设置多个按钮 
            ```
            UIBarButtonItem *left2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashClick)];
            //多个拨钮
            self.navigationItem.rightBarButtonItems = @(left, left2);
            self.navigationItem.leftBarButtonItems = @(left, left2);
            ```
        5. 设置title的情况下，下一个控制器的返回按钮会是现在的控制器的title，重新设置为返回
            ```
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@FANHUI" style: UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = backItem;
            ```
        6. 导航控制器下，非根控制器的导航栏的左侧按钮如果被自定义了，那么系统生活生成的返回按钮就不存在了，需要自定写返回上一个
        7. 获取当前控制器的文本框的内容传递到下一个控制器
            ```
            // UIStoryboardSegue; 拉线的对象
            // identifier 标记
            //     sourceViewController 源控制器
            // destinationViewController 目标控制器
            // 通过 storyboard拖线的方式实现跳转的时候就会调用这个方法
            (void) prepareForSegue: (UIStoryboardSegue *)segue sender: (id) sender {
                //获取文本框的内容
                NSString *text = self. textField.text;
                //获取目标控制器
                NMGreenViewController *greenVc = segue.destinationViewController;
                greenVc.navigationItem.title = text;
            }
            ```