1. 用brew安装nvm后打开iterm后出现下面的问题
```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```
2. 运行compinit出现下面的内容
```
There are insecure directories:
/usr/local/share/zsh/site-functions
/usr/local/share/zsh
```
3. 解决这个问题需要用到下面的
```
sudo chmod -R 755 /usr/local/share/zsh
```