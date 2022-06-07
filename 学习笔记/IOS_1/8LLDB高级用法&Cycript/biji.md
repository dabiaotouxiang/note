# ASLR
hopper，ida中的都基本上是文件虚拟地址，要加上文件偏移地址(随机的，slider，滑块)，才能在lldb中打印断点

要得到ASLR可以用imagelist找到mach-o文件的主地址，与pagezero0x100000000的差值就是slider，然后和hopper，ida中的地址相加就可以

## chisel插件
可以用brew封装，也可以git clone

xcode重启或者在lldb使用`command source ~/.lldbinit`

## DerekSelander/LLDB 插件
git安装

# cycript

官网 http://www.cycript.org 下载。放到合适的目录下，比如opt，并配置到路径

## cycript调试APP
MonkeyDev自动注入crypt的lib，然后用crcrypt -r ip:6666(默认端口号) 链接

## Monkeydev
在Cycrypt.plist中有封装的cy文件，里面是一些快捷的指令