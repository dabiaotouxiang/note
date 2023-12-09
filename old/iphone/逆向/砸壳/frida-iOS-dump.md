# 安装
MonkeyDev里面集成了
## frida 安装
1. pip install frida-tools
2. 报错`TypeError: endswith first arg must be bytes or a tuple of bytes, not str`
3. 看看自己的pip的frida的版本，直接看pip打印的日志就行
4. 去https://pypi.tuna.tsinghua.edu.cn/simple/frida/ 下载对应版本的egg文件
5. 将文件放到`~/`下
6. 重新进行pip intall frida-tools

手机cydia搜索安装frida插件
# 下载依赖
`https://github.com/AloneMonkey/frida-ios-dump/blob/master/requirements.txt`
# MonkeyDev里面的位置
`/opt/MonkeyDev/bin/dump.py`
# 使用
0. 使用usb端口转发的要先转发一下端口
1. 使用的时候最好先frida-ps -U 找到要dump的进程，注意app要运行状态
2. 要修改一下dump.py里面的ssh配置，改成自己的
3. 手机最好不要进入休眠
4. 使用 `dump.py 微信`

# 特色
我在`/opt/MonkeyDev/bin/`里面建了一个env，然后写了dump.sh来调用
```
. /opt/MonkeyDev/bin/env/bin/activate
dump.py $1
```

# 注意
需要关掉reveal2loader的插件
