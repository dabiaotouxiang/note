1. 规范:
    1. 字典转模型
        1. 读取的plist文件的配置，对于NSDictionary类型的数据要转成对象
        2. 对于字典转换成的对象的类要有initWithDict和xxxWithDict方法，模版大概是
            ```
            - (instancetype)initWithDict:(NSDictionary *)dict{
                if (self = [super init]){
                    self.title = dict[@"title"];
                    self.name = dict[@"name"];
                }
                return self;
            }

            + (instancetype)appWithDict:(NSDictionary *)dict{
                return [[self alloc] initWithDict:dict];
            }
            ```
    2. xib文件
        1. 用来封装一个UIView。开发时处理的文件是xib，部署的时候文件类型就被编译为nib文件了
        2. 为xib写一个view类，然后把下面的子控件拖线为属性，view的类名和xib的名称最好一致
        3. 要为xib文件添加一个model类，接收plist数据，重写setter方法，view文件中原来的拖线写到类扩展中。
        4. 读取nib文件 `AppIconDownload * app = [[[NSBundle mainBundle] loadNibNamed:@"xxx" ...] firstObject]`文件名不用写nib后缀
        5. 以上的读取nib文件写入view的方法
            ```
            + (instancetype) appIconDownload{
                return [[[NSBundle mainBundle] loadNibNamed:@"AppIconDownload" owner:nil options:nil] firstObject];
            }
            ```
    3. UILabel
        1. label.alpha 可以设置透明度，值为0-1
        2. label.layer.cornerRadius = 10; 设置圆角半径
        3. label.layer.masksToBounds = YES; 减去圆角多余的部分
    4. UIView中的动画
        ```
        // animateWithDuration 动画时间
        // animations 动画的内容 
        // completion 动画结束后的动作
        [UIView animateWithDuration:1.5 animations:^{
                label.alpha = 0.6;
            } completion:^(BOOL finished){
                if (finished){
                    [UIView animateWithDuration:1.5 animations:^{
                        label.alpha = 0;
                    } completion:^(BOOL finished){
                        if (finished){
                            [label removeFromSuperview];
                        }
                    }];
                }
            }];
        ```