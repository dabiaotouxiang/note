0. 把内网ip地址在wifi上绑定
1. xcode安装，并安装tools
2. 安装iterm2
3. 安装zsh插件，放到/opt/zsh目录下
4. 配置ll

`vim .zshrc`或者`vim ~/.bash_profile`
```
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
```
5. vscode安装
    1. Markdown Preview Github Styling
6. 安装百度网盘
7. 百度网盘下载ssr wireguard ida machoview 
8. 安装chrome，同步数据
9. 安装迅雷 微信 钉钉 网易云 iina sublime 爱思助手 reveal virtualbox wireshark
10. 配置pip

`mkdir .pip`

`vim .pip/pip.conf`

```
[global]
index-url =  http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com
```
11. git的sshkey，生成并替换
12. ssh的config 还原
```
Host 6s
Hostname 192.168.31.96
User root
# password alpine
```