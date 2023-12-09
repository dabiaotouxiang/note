1. 找一个目录，这里我找的`～/git`
```
cd ~/git
git clone https://github.com/cnpm/nvm.git
```

2. 配置终端启动时自动执行，在`~/.bashrc`，`~/.bash_profile`，`~/.profile`，或者`~/.zshrc`文件中添加以下命令:
```
source ~/git/nvm/nvm.sh
```
再重新打开终端，输入nvm就会发现这是一个可以用的命令了。

3. 通过nvm安装node
```
# 该命令可以看到能够安装的node版本
nvm ls-remote

#该命令可以安装指定版本的node，偶数为稳定版，推荐安装偶数的版本
nvm install 版本号

# 当使用nvm安装了多个版本的node时，通过这个命令改变当前终端的node版本
nvm use 版本号

# 设置默认的node版本
nvm alias default version(版本号)

# 安装cnpm在国内安装依赖会快很多
npm install -g cnpm

# 但是cnpm据说坑比较多，不太建议用
# 可以用下面这个持久化设置register为淘宝
npm config set registry https://registry.npm.taobao.org

# 临时设置
npm --registry https://registry.npm.taobao.org install express

# 查看当前设置
npm config get registry

# 安装并同步运行时依赖到当前项目
npm/cnpm install 依赖名 --save
# 安装并同步开发时依赖到当前项目
npm/cnpm install 依赖名 --save-dev

# 这两个安装体现到package.json里就是分别配置在dependencies字段，devDependencies字段
```

## manjaro 安装
```
sudo pacman -S nvm
vim ~/.bashrc
```
在bashrc中添加
```
source /usr/share/nvm/init-nvm.sh
```