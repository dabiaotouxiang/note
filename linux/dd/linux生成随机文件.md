平时在做读写，或者传输测试的时候需要一些随机文件，可以这样生成
<!-- more -->
1. 第一种
    ```bash
    dd if=/dev/zero of=zeroFile bs=1M count=1000
    ```
    运行该命令后，会在当前目录生成一个名为zeroFile的文件，大小为1个G，内容全为0  
    ![](全为零的文件.png)  
    不过不建议用，很难发现比对出传输过程中文件有没有损坏
2. 第二种
    ```bash
    dd if=/dev/urandom of=randomFile bs=1M count=1000
    ```
    生成一个G的随机数文件  
    ![](随机数文件.png)
    速度也很快，建议用这个
3. 第三种
    ```bash
    dd if=/dev/random of=randomFile bs=1M count=1000
    ```
   速度奇慢，不等了，也不截图了，测试没必要等那么久，不建议用