1. UIScrollView
    1. 里面的监听滚动事件
        1. 要实现UIScrollViewDelegate 协议，直接在当前controller实现就行。也可以直接在storybord的scrollView上右键然后连线，但是这样好像没有提示。
        2. -(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView 监听开始拖动
        3. - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate 监听结束拖动
        4. - (void)scrollViewDidScroll:(UIScrollView *)scrollView 监听滚动
    2. self.imgScrollView.showsHorizontalScrollIndicator = NO; 隐藏水平滚动轴
    3. self.imgScrollView.pagingEnabled = YES; 是否分页，按照scrollView本身的宽度分页
2. timer
    1. NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImg) userInfo:nil repeats:YES]; 定时执行
    2. 这个优先级很低，在点击别的控件的时候，这就会停下，通过设置`[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];` 可以设置好
    3. `[self.timer invalidate];` 停止计时器，停止后计时器无法再重新启动，需要重新创建一个