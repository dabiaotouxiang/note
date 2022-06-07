1. iOS的事件
    1. 触摸事件
    ```
    - (void) touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event;
    - (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *)event;
    - (void) touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event:
    - (void) touchesCancelled: (NSSet *) touches withEvent: (UIEvent *) event:
    ```
    2. 加速计事件
    ```
    - (void)motionBegan: (UIEventSubtype)motion withEvent: (UIEvent *)event;
    - (void)motionEnded: (UIEventSubtype)motion withEvent: (UIEvent *)event;
    - (void)motionCancelled: (UIEventSubtype)motion withEvent: (UIEvent *)event;
    ```
    3. 远程控制事件
    ```
    - (void) remoteControlReceivedWithEvent: (UIEvent *)event;
    ```
2. 响应者对象
    1. 只有继承了UIResponder的对象才能接收并处理事件，称之为响应者对象
    2. UIApplication，UIViewController，UIView都继承自UIResponder，因此他们都是响应者对象，都能就收并处理事件
3. NSSet和NSArray的区别
    1. set
        1. 无序
        2. 获取object用 anyObject
        3. 效率高
        4. 遍历用 forin
    2. array
        1. 有序
        2. 通过下标获取
        3. 遍历用for forin
4. 触摸事件的UITouch的对象
    1. touch.tapCount 快速点击的次数
    2. touch.phase 触摸的阶段
    3. touch.window 当前在的window
    4. 当前的坐标
        1. `CGPoint p = [t locationInView:self.superview];` 获取坐标的时候，坐标是相对于传入的view来说的
    5. 上一个点的坐标 `CGPoint p = [t previousLocationInView:self.superview];` 获取上一个点的坐标
 5. 控件无响应的情况
    1. user interaction = no 
    2. 控件隐藏
    3. 同名度小于0.01
    4. 子视图超出了父控件的有效范围
6. 监听的过程
    1. 运行循环要监听所有的事件，从UIApplication -> UIWindow -> RootViewController -> view -> button。从最底层的application开始一直到button结束，会用hitTest进行所有的view的测试，一直到测试到可以运行的位置
    2. 响应的时候，第一个响应的就叫第一响应者