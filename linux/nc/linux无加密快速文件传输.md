平时我都是用rsync进行文件的传输，今天试了一下用nc  
基于centos7
<!--more-->
# nc命令进行数据传输  
接收端：
`nc -l xx.xx.xx.xx 9999 > jieshou.iso`
发送端:
`time nc  xx.xx.xx.xx 9999 < CentOS-6.9-x86_64-bin-DVD2.iso`  
> -l:监听一个端口来接受数据
> -u:不使用TCP而是使用UDP来进行数据连接，可能会更快
> time:用于计时

## 注意，我在传输的时候由于本身带宽限制，所以没办法测出两者差距（垃圾公司网）

# 标明传输进度
## 这个还没有测试，仅做记录
用pv
```bash
yum install epel-release -y
yum install pv -y
cat CentOS-6.9-x86_64-bin-DVD2.iso |pv -b | nc  xx.xx.xx.xx 9999
```
接收端
```bash
nc -l xx.xx.xx.xx 9999 | pv -b > home.tar.gz
```
发送端
```bash
tar -czf - /home/ | nc  xx.xx.xx.xx 9999
```

# 中转文件
## 这个还没有测试，仅做记录
A、B、C三台主机，A美国，C昌南，C只能访问到B，不能直接访问A，B和AC互通。C要怎么才能拿到A上的文件呢？
C上执行：
```bash
nc -l 9999 > google_file.txt
```
B上执行：
```bash
nc -l 9999 | nc (C的外网IP) 9999
```
A上执行：
```bash
nc (B的外网IP) 9999 < google_file.txt
```

# 转载自[笛声](https://hqidi.com/108.html)
## 原作者也在感叹国内扑朔迷离的网络环境