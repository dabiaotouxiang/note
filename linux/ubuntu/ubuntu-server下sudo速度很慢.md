### 解决办法:
1. 首先输入hostname,得到本机的互联网名称
2. sudo vi /etc/hosts
3. 添加`127.0.0.1 本机互联网名称 本机互联网名称.localdomain`
4. 关闭保存，速度正常

### 原因
据说是由于Ubuntu Server被设计成一种类似于分布式的操作系统网结构，允许/etc/sudoers中的成员不在本机上。从而sudo时会先从网络上寻找可能的sudoer然后才是本地. 而这10s左右的时间就是整个DNS流程的最长时间.


摘自[Ubuntu下sudo速度很慢原因及解决办法](https://blog.csdn.net/Kiritow/article/details/80687036)