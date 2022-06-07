# 老版本的
1. 在 https://github.com/stefanesser/dumpdecrypted
2. 下载后make，有warn没关系
3. 拷贝到手机
4. `ldid -S dumpdecrypted.dylib`进行一个临时的签名
5. 启动app
6. 插入动态库 `DYLD_INSERT_LIBRARIES=dumpdecrypted.dylib /var/containers/Bundle/Application/0A856149-60F7-428F-B5D7-21A994340F42/WeChat.app/WeChat`
7. 进程通过`ps -A` 查找
8. 最后只能得到Mach-O的脱壳文件，不会有ipa包
9. 还能用，结果在当前目录`.decrypted`结尾的文件

# 新版本的
1. 刘培庆大神的，需要先安装MonkeyDEV
2. https://github.com/AloneMonkey/dumpdecrypted
3. launch的时候要在在该项目的target的build settings 中添加一个参数, 点击Add User-Defined Setting, 添加CODE_SIGNING_ALLOWED=NO
4. 按照官网配置，如果配置了ssh免密登陆，就不用再配置passwd了，如果没有，要配置，然后要安装sshpass`brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb`
5. 就是把老版本的封装了一下
6. 目前看来没什么特殊的，直接就用老版本的好了