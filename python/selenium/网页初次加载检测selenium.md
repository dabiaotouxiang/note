最近遇到一个网站，会在初次加载的时候加载一个js脚本来获取浏览器的特征值，包含了selenium的检测，这个js脚本做了控制流混淆，所有的获取浏览器特征值的函数都是动态生成的，同时返回的数据也是经过加密的，硬钢了一周多也只是通过debug看到了未加密过的数据，加密函数和参数都没找到。所以换了一种方式来通过验证

步骤如下
1. 通过命令行带参数启动chrome
2. 等待十几秒，待js文件将参数返回后，用selenium进行连接
3. 进行操作
4. 完成后用driver.close()关闭chrome


部分代码
chrome 启动部分
```
def open_chrome(ip):
    cwd = os.getcwd()
    user_data_dir = cwd + "xxxxxx"
    if os.path.exists(user_data_dir):
        pass
    else:
        os.mkdir(user_data_dir)
    open_cmd = "chrome --new-window www.baidu.com --disable-web-security --remote-debugging-port=9222 --user-data-dir=" + user_data_dir
    if ip is None:
        pass
    else:
        open_cmd = open_cmd + " --proxy-server=http://" + ip[0]["ip"] + ":" + str(ip[0]["port"])
    subprocess.call(open_cmd)
```
mac上启动
```
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://www.nike.com/cn/login --no-first-run
```
加上--no-first-run启动，指定文件夹的时候就不会有提醒设为默认浏览器了


selenium 链接部分
```
def operate_chrome():
    chrome_options = Options()
    chrome_options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")
    chrome_options.add_argument("blink-settings=imageEnabled=false")
    driver = webdriver.Chrome(options=chrome_options)
```

使用的时候
```
# 因为chrome启动后如果没有关闭的话，程序是不会向下走的，是阻塞式的，所以单开一个线程进行
_thread.start_new_thread(open_chrome, (ip_data))
operate_chrome()
```