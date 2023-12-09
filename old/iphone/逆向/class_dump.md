1. git clone https://github.com/nygard/class-dump.git
2. xcode打开，build
3. 如果报错"error: use of undeclared identifier 'PLATFORM_IOSMAC'"
    1. Replace case PLATFORM_IOSMAC: return @"iOS Mac"; with case PLATFORM_MACCATALYST: return @"mac catalyst";
4. build的时候注意切换为classdump，有时候打开默认是formatType
5. monkeydev 自带.
    1. xcode打开MonkeyDev项目，里面有MONKEYDEV_CLASS_DUMP设置为YES，会在build的时候导出头文件
6. class-dump -H WeChat -o ./WeChat_headers