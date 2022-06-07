# MachO文件
* 概述: Mach-O其实是Mach Object文件格式的缩写，是mac以及iOS上可执行文件的格式，类似于windwos上的PE格式(Portable Executable)，linux上的elf格式(Executable and Linking Format)

## Mach-O文件格式
* Mach-O为Mach object文件格式的缩写，它是一种用于可执行文件，目标代码，动态库的文件格式。作为a.out格式的替代，Mach-O提供了更强的扩展性。
* 属于MachO的常见文件
    * 目标文件.o object文件 ![](./o结尾文件.png)
    * 库文件
        * .a
        * .dylib ![](./dylib.png) 可执行文件被加载的时候，由dyld加载dylib文件
        * Framework
    * 可执行文件 ![](./可执行文件.png) 可以clang xxx.o 生成 也可以clang -o test2 test.o ![](./clang编译链接.png) ![](./编译并连接.png)
    * dyld ![](./dyld.png) 动态链接器
    * .dsym 真机调试，将版本改为release 用于查看app崩溃信息的文件
        ![](./修改为真机调试1.png)  
        ![](./修改为真机调试2.png)
        ![](./dSYM文件位置.png)
        ![](./dSYM包内信息.png)
        ![](./dSYM.png)
* File指令
    * 通过`file 文件路径`查看文件的类型

## 可执行文件
* 可以在编译的app里面查找可执行文件，用file查看
* 一般都是arm64架构的，5s以前的手机有armv7，10.3系统之前也有
* 通用二进制文件(选择10.2系统) ![](./10.2系统.png)
* xcode 查看修改架构 ![](./xcode查看修改架构.png)

### 通用二进制文件(Universal binary)
* 苹果公司提出的一种程序代码。能同时适用多种架构的二进制文件
* 同一个程序包内同时为多种机构提供最理想的性能。
* 因为需要储存多种代码，通用二进制应用程序通常比单一平台二进制文件要大
* 但是由于两种架构有共通的非执行资源，所以并不会达到单一版本的两倍之多
* 而且由于执行中只调用一部分代码，运行起来也不需要额外的内存
#### 通用二进制文件的拆分
![](./拆分.png)
![](./合并.png)
* lipo命令
    1. 使用lipo -info 可以查看MachO文件包含的架构
    2. lipo MachO文件 -thin 架构 -output 输出文件路径
    3. lipo -create MachO1 MachO2 -output 输出文件路径

### MachO文件结构
![](./macho文件结构.png)

* 查看胖文件的头信息`otool -f demo` ![](./otool查看胖文件头信息.png)

#### MachOview
##### header
说明加载信息，让内核读取后能快速的读取文件

* 可以直接查看loader.h的源码，查看header包含的信息(进xcode command+shift+o 搜索loader)
* loader.h源码中的64位header信息 ![](./header数据结构.png)
* loader.h源码中的十一种Mach-o文件 ![](./十一种macho文件.png)
* 标志位信息 ![](./标志位.png)

##### LoadCommands加载命令
![](./loadcommands含义表格.png)

系统读取header信息后，开始用dyld根据loadcommands进行加载
* loadcommands内存映射数据![](./loadcommands.png)
* dyld加载信息 ![](./dyld_machoview.png)
* 符号表 ![](./符号表.png)
* 调用dyld，前面的都是内核在做 ![](./加载dyld.png)
* uuid ![](./uuid_machoview.png)
* 版本 ![](./版本.png)
* 加载main ![](./加载main.png)
* 加密情况 ![](./加密信息.png)
* 依赖，三方库地址 ![](./依赖，三方库地址.png)
* 起始位置表，代码签名 ![](./起始位置表，代码签名.png)

##### pagezero
* pagezero ![](./pagezero.png)

##### text段 放代码
![](./text.png)

##### data段 放数据
![](./data.png)


##### linkedit
包含了 Dynamic Loader Info 之类的动态链接信息


### dyld
*内核去读取信息，最终还是要dyld去加载程序*

dyld (the dynamic link editor)是苹果的动态链接器，是苹果操作系统的一个重要组成部分，在内核做好准备工作之后，交给dyld负责剩下的工作

#### main 加断点调试
* 发现main被start调用，但是该函数仅仅是调用了main，其他的什么都没做
![](./main函数加断点.png)

#### load加断点
* load 在main之前 ![](./load加断点.png)

* dyld_start ![](./dyld_start.png)

* dyld start分析 ![](./找到start分析.png)

* 进入main函数分析 dyld加载macho的主要函数 进行相关环境的配置操作
![](./dyld_main1.png)
![](./dyld_main2.png)
![](./dyld_mian3.png)

    * 环境变量配置位置 ![](./环境变量配置位置.png)

* main函数 加载共享缓存
![](./main加载缓存.png)

* main函数 实例化主程序 ![](./实例化主程序.png)

* 动态库加载
    * ![](./动态库1.png)
    * ![](./动态库2.png)
    * ![](./动态库3.png)
    * 然后进行绑定和弱绑定

* 初始化方法，启动main
    * 根据load断点的调用栈去找启动过程 ![](./laod断点调用栈.png)
    * 找到start中的initializeMainExecutable调用位置![](./1.png)
    * 进入initializeMainExecutable定义，找到runInitializers  ![](./initializeMainExecutable.png)
    * 进入runInitializers，找到processInitializers ![](./runInitializers.png)
    * 进入processInitializers，找到recursiveInitialization，![](./processInitializers.png)
    * 进入recursiveInitialization，找到notifySingle![](./notifySingle.png)发现了sNotifyObjCInit赋值是一个指针回调，需要找到赋值位置
    * sNotifyObjCInit赋值 ![](./sNotifyObjCInit赋值.png) 发现是在registerObjCNotifiers
    * registerObjCNotifiers被调用 ![](./registerObjCNotifiers被调用.png)
    * 因为是api被别人调用，在demo中打一个符号断点，发现调用位置![](./_dyld_objc_notify_register符号断点.png)![](./被objc_init调用.png)
    * 查看objc源码，找到了 ![](./找到了_dyld_objc_notify_register.png)
    * init就是loadimages方法 ![](./loadimages.png)![](./load方法.png)

    * 到这就找到了load的加载位置

    * recursiveInitialization 函数中，load完images之后，运行了doInitialization。![](./doInitialization.png)。该方法 的用途:
        * 在demo中的main中加下面的两个函数 ![](./新加函数.png)
        * 编译后，用machoview打开macho文件 ![](./machoview观察新加函数.png)
        * doModInitFuncitons就是在加载类似这两个函数的函数
        * 在load之后

* 后面就是 自己程序的main