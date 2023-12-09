# frida 安装方法1
1. pip install frida-tools
2. 报错`TypeError: endswith first arg must be bytes or a tuple of bytes, not str`
3. 看看自己的pip的frida的版本，直接看pip打印的日志就行
4. 去https://pypi.tuna.tsinghua.edu.cn/simple/frida/ 下载对应版本的egg文件
5. 将文件放到`~/`下
6. 重新进行pip intall frida-tools

# frida 安装方法2
1. pip install frida-tools
2. 报错`TypeError: endswith first arg must be bytes or a tuple of bytes, not str`
3. 看看自己的pip的frida的版本，直接看pip打印的日志就行，直接点击下载链接，进行压缩文件的下载。我的链接是`https://mirror.sjtu.edu.cn/pypi-packages/c6/0e/9b837472e1dd866ef002a6bf5f2dde42b0c4f0bfcf8f5ab80797a148025e/frida-15.1.17.tar.gz`
4. 解压压缩文件，进入，修改setup.py的205行，在`parse_result = urlparse(url)`后面添加`.decode()`
5. `python setup.py install`进行安装
