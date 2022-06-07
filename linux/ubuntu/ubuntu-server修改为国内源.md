1、原文件备份

`sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak`

2、编辑源列表文件

`sudo vim /etc/apt/sources.list`

3、替换

`:%s/cn.archive.ubuntu.com/mirrors.ustc.edu.cn/g`

4、运行sudo apt-get update



## 如果是直接替换整个文件的方法
注意去源的官网找到合适你的ubuntu的版本的配置

比如阿里云源的配置介绍

https://developer.aliyun.com/mirror/ubuntu