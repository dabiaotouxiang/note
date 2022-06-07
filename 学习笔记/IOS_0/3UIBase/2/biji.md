1. 文件结构介绍
    1. 可以自定义viewController.h文件.m文件，在storyboard中选择指向
2. 类前缀
    1. 比如NS，UI之类的类前缀
    2. 可以在project里面设置，ClassPress，设置后新增的类都会带前缀。点击项目名，在Xcode右侧进行设置
3. transform
    1. CGAffinaTransform transForm = self.button.transForm;
    2. 修改结构体的值，x,y平移
        1. self.button.transform = CGAffineTransformMakeTranslation(0， -50) 在原来的基础上y -50。意思是基于最初的值，后面无论运行这句几次，都是最初的值为基础
        2. self.button.transform = CGAffineTransformTranslate(self.button.transform, 0， -50) 基于现有的当前的值进行修改。
    3. 缩放
        1. self.button.transform = CGAffineTransformMakeScale(0.5， 0.5) 在原来的基础上进行缩放，x，y轴各缩放0.5
        2. self.button.transform = CGAffineTransformScale(0.5， 0.5) 在现有的基础上进行缩放
    4. 旋转
        1. self.button.transform = CGAffineTransformMakeRotation(3.14/2); 二分之一弧度，逆时针，最初的基础上
        2. self.button.transform = CGAffineTransformRotation(3.14/2); 当前基础上
    5. 清空之前的操作，回到原始状态
        1. self.btnIcon.transform = CGAffineTransformIdentity;

4. UIView的常见属性
    1. superview 父控件
    2. subviews 所有的子控件
    3. removeFromSuperview 从父控件移除

5. 懒加载
    1. 重写getter方法，当调用getter方法的时候再从文件或者其他地方读取。

6. 获取当前的app的运行目录
    1. `[NSBundle mainBundle]`
    2. 获取目录下的文件 `[[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"jpg"]]`

7. imageView下的动画
    1. .animationImages = imgList; 将动画要播放的图片传递给imageView
    2. .animationDuration = imgList.count * 0.1; 动画持续时间
    3. .animationRepeatCount = 1; 动画重复次数 默认是循环播放
    4. [self.imgBackGround startAnimating]; 开始播放
    5. self.imgBackGround.isAnimating 当前是否有动画在播放
    6. [self.imgBackGround performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:imgList.count * 0.1]; imageView的一个方法，可以选择在经过多长时间后调用哪个方法，这里是在动画结束后释放动画图片

8. 图片加载
    1. 存储在缓存中，等程序结束释放，无论有没有引用`[UIImage imageNamed:@"xxx"];` 直接将文件放在assets中
    2. 无引用就释放 `[UIImage imageWithContentsOfFile:@"xxxx"];` 需要将文件放在项目目录下，并且用`[NSBundle mainBundle]`去寻找编译生成的项目下的图片的地址