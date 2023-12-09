最近终端启动很慢，大概有3秒左右
而且最近只装过这玩意儿，且有其他博主说过这东西会导致加载慢，因nvm在安装的时候，需要在 ~/.bashrc 中添加：
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 
```
解决办法
```
export NVM_DIR="$HOME/.nvm"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v14.3.0/bin/:$PATH
```
原理是启动终端的时候不执行nvm.sh脚本。而是直接把某个具体版本的node的路径放到PATH中。等到执行nvm的时候，再去执行nvm.sh脚本