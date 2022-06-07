1. 手势对象
    1. 分类
        1. UITapGestureRecognizer 敲击
        2. UILongPressGestureRecognizer 长按
        3. UISwipeGestureRecognizer 轻扫
        4. UIPinchGestureRecognizer 捏合 用于缩放
        5. UIPanGestureRecognizer 拖拽
        6. UIRotationGestureRecognizer 旋转
    2. 实现的过程
        1. 创建手势对象
        2. 对一个view添加手势
        3. 实现手势的方法
    3. 使用看代码
2. CALayer
    1. iOS中看到的基本上都是UIView,UIView之所以能显示就因为UIView里面有CALayer对象。通过UIView的layer属性访问，当UIView需要显示到屏幕上时，会调用drawRect:方法进行绘图，并且会将所有内容绘制在自己的图层上，绘图完毕后，系统会将图层拷贝到屏幕上，于是就完成了UIView的显示
    2. UIView本身不具备显示的功能，使它内部的layer才有显示功能
    3. 例子和实用看代码
3. CADDisplayLink 
    1. CADDisplayLink 是一种以屏幕刷新率出发的时钟机制，每秒钟60次左右
    2. CADDisplayLink 是一个计时器，可以使绘图代码与视图的刷新频率保持同步，而NStimer无法确保计时器实际触发的准确时间
    3. 使用方法:
        1. 定义CADDisplayLink并指定触发调用方法
        2. 将显示连接添加到主运行循环队列
        3. 实例
            ```
            CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector: @selector(timeChange)];
            [link addToRunLoop: [NSRunLoop mainRunLoop] forMode: NSDefaultRunLoopMode];
            ```
4. 核心动画(简介)
    1. Core Animation直接操作在CAlayer上的
    2. 过度动画type ![](./Screen%20Shot%202022-05-29%20at%2021.19.19.png)