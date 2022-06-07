1. 安装
    1. 在https://github.com/KJCracks/Clutch下载
    2. 拷贝至手机的/usr/bin 目录
    3. 给Clutch 添加运行权限 `chmod +x`
2. 找到要砸壳的应用的编号`Clutch -i`
```
1:   微信 <com.tencent.xin>
```
3. 进行砸壳 
```
Clutch -d 1
```
4. 有些会有一些错误，类似下面这样的，主要看有没有ipa生成
```
2021-12-17 14:46:49.641 Clutch[17232:3491024] failed operation :(
2021-12-17 14:46:49.641 Clutch[17232:3491024] application <NSOperationQueue: 0x1036d1170>{name = 'NSOperationQueue 0x1036d1170'}
Child exited with status 9
Error: Failed to dump <Lottie> with arch arm64
```
5. 目前在14.2上进行的dump均失败，可以以后学习一下原理，然后试着改一下

注意: 只能在越狱手机使用