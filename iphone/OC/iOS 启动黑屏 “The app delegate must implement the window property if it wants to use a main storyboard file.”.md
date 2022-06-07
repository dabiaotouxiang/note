Xcode Debug 窗口提示：
The app delegate must implement the window property if it wants to use a main storyboard file.
根据提示打开 AppDelegate.h 文件时候发现确实没有声明 UIWindow 属性

补充缺失的代码即可：
```
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

@end
```