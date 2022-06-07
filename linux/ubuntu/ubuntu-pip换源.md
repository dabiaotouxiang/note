1. pip.conf文件的位置
```
/etc/pip.conf
~/.pip/pip.conf
```

2. pip.conf文件的内容
```
[global]
index-url = http://pypi.douban.com/simple #豆瓣源，可以换成其他的源
extra-index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = 
    pypi.douban.com            #添加豆瓣源为可信主机，要不然可能报错
    pypi.tuna.tsinghua.edu.cn       #清华
timeout = 120
```