0. 参照 https://frida.re/docs/building/
1. `sudo apt-get install build-essential curl git lib32stdc++-9-dev \
    libc6-dev-i386 nodejs npm python3-dev python3-pip`\
2. `git clone --recurse-submodules https://github.com/frida/frida.git`
3. `cd frida && virtualenv -p python3 env && . env/bin/active`
4. `pip3 install colorama prompt-toolkit pygments`
5. `make` 可以查看编译列表，我的选项是`make python-linux-x86_64`
6. `cd frida-python`
7. `export FRIDA_VERSION=15.1.19.c52827f` 版本号自己修改
8. `export FRIDA_EXTENSION=/home/xxx/Documents/frida/build/frida-linux-x86_64/lib/python3.8/site-packages/_frida.so` 路径自己修改
9. `python setup.py bdist_egg` 会生成egg文件
10. `python setup.py install` 安装