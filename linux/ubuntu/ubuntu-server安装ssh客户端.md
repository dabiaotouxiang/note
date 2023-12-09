在本地虚拟机安装ubuntu-server后，想用ssh链接，结果发现不行，22端口没开，然后发现ubuntu只是默认安装了ssh客户端，可以连别人。

想被别人连，得再安装一个ssh服务端

```
sudo apt-get install openssh-server
```
命令运行完了后，可以
```
ps -ef | grep ssh
```
看一下