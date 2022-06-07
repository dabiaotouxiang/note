# 插入动态库
1. 将.framework文件或者是.dylib文件拷贝至手机
2. 在手机的命令行输入DYLIB_INSERT_LIBRARIES=insertlib.framework/insertlib 进程文件
3. 只执行一次

# 砸壳
## 原理
1. 静态砸壳: 在了解了加密算法和逻辑后进行解密。难度大，很容易被通过修改加密方式或参数来进行防护
2. 动态: 将内存中的image给dump出来

## 工具
1. clutch 
    1. github上搜索clutch 下载后拷贝到手机上用
    2. clutch -i 查看app列表，第一列是编号
    3. clutch -d 编号 进行dump
2. dumpdecrypt.dylib 插入动态库的方法进行。最后得到的是xxx.decrypted文件，为砸壳后的macho文件
3. frida-ios-dump
    1. 基于frida实现
    2. 在github下载
    3. frida-ps 打印当前的进程 frida-ps -U 自动查找usb并打印手机进程
    4. frida -U 微信 附加进程到微信
    5. 修改dump.py文件中的ssh配置，然后./dump.py 微信进行砸壳
