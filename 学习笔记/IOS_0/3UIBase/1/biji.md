1. view
    1. label 只能显示文字，text可以显示可以写入文件
    2. 继承自UIView
        1. UILabel 文本标签，只能看文字
        2. UIButton 按钮，能点击
        3. UITextField 文本输入框
    3. 每个UIView都是一个容器，可以放其他的子控件，子控件所在的容器叫父控件，父控件包含子控件
    4. 每个view的作用就是展示采集数据
2. UIViewController来管理UIView，创建显示销毁UIView，监听UIView的内部事件，处理UIView与用户的交互
3. 把Button拖进ViewController.m文件的ViewController的类扩展中
    1. IBAction代表void，只有这么写才能连线
    2. 希望是属性的连线，拖过来用outlet
    3. 键盘
        1. 谁叫出键盘，谁是第一响应者，让第一响应者辞职，就可以把键盘叫回去
            ```
            [self.textNum2 resignFirstResponder];
            [self.textNum1 resignFirstResponder];
            ```
        2. self.view就是当前控制器管理的view，让当前的view停止编辑，就会把键盘回收 
            ```
            [self.view endEditing:YES];
            ```
4. IBOutlet 在@property中是为了拖线
5. the class is not keyvalue coding-compliant for the key xxx 该错误一般是连线的属性或者方法被删除了，连线没删
6. UIButton的使用
    1. self.buttonIcon.frame 就是CGRect，修改的时候先获取再重新赋值，获取左上角的坐标
    2. sender参数传递的是Button按钮对象，可以多个按钮指向一个有sender参数的方法，根据sender参数传递的对象不同来选择不同的方法，根据tag来区分，sender.tag，tag在Button的属性里设置
    3. button.center(位置设置) CGPoint 控制中心点坐标 button.bounds(大小设置) CGRect 里面x,y都是0不能改位置，只能改大小 button.transform（位置，大小，旋转等设置）
    4. 按钮状态.
        1. normal (普通状态)
        2. highlighted（高亮状态）
        3. disabled（失效禁用状态）
7. 自动布局，禁用自动布局可以自动调整大小
8. 动画
    1. 头尾式设置
        1. 开启动画 `[UIView beginAnimation:nil context:nil];`
        2. 设置动画的执行时间 `[UIView setAnimationDuration: 2];`
        3. 提交动画 `[UIView commit:Animations];`
        4. 把要用动画效果的动作放在2，3之间，比如放大，缩小，平移等
    2. block格式设置动画
        ```
        [UIView animateWithDuration:2 animations:^{
            要有动画效果的代码写在这;
        }];
        ```
9. 纯代码实现buton
    1. viewdidload 要显示一个界面，首先创建这个界面对应的控制器，控制器创建好之后，再创建view，view加载完毕后就会调用viewdidload方法，viewdidload被执行，就表示控制器所管理的view创建好了
    2. 动态创建自己的按钮
        1. `UIButton *button = [[UIButton alloc] init];` 创建按钮
        2. 设置按钮上的文字 普通状态
            ```
            [button setTitle:@"点我吧" forState:UIControlStateNormal];
            // 设置颜色
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            ```
        3. 设置高亮状态下的文字
            ```
            [button setTitle:@"点我吧" forState:UIControlStateHighLighted];
            ```
        4. 设置普通状态下的背景图片
            ```
            NIImage *imageNormal = [UIImage imageNamed:@"xxx"]; // png格式的可以省略扩展名
            [button setBackgroudImage:imgNormal forState:UIControlStateNormal];
            ```
        5. 设置高亮状态下的背景图片
            ```
            NIImage *imageNormal = [UIImage imageNamed:@"xxx"]; // png格式的可以省略扩展名
            [button setBackgroudImage:imgNormal forState:UIControlStateHighLighted];
            ```
        6. 设置按钮的frame
            ```
            button.frame = CGRectMake(20, 30, 100 , 100);
            ```
        7. 为button注册一次单击事件
            ```
            [button addTarget:self action:@selector(自己的函数名 注意带参数的有冒号) forControlEvents:UIControlEventTouchUpInside];
            ```
        8. 把button加入到父view中
            ```
            [self.view addsubView:button];
            ```
        9. 以上在viewdidload里，就可以在页面加载时动态创建。storyboard的本质就是转为上面写的代码