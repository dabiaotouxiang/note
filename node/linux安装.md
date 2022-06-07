```
yum groupinstall 'Development Tools'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
# 上面的报443就去nvm的git复制install.sh下来，手动运行

运行结束后，关闭当前终端，重新打开，看nvm命令是否可以使用了
```

ubuntu下第一条命令改为
```
sudo apt-get update
sudo apt-get install build-essential
```