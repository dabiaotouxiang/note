由于这个好久没有更新了，所以有些bug没有解决，但是有一个好处，这一版的webdriver更不易被检测，至少nike的是如此

chromium版本应该是75开头的

## 下载chromium的问题
由于初始化的时候会下载chromium，国内的用户大概率会遇到443错误，所以可以看一下`env/lib/site-packages/pyppeteer/chromium_download.py`，找到下载的url，版本，存放目录，下载后的操作，手动进行操作，下载的话可以在国内的镜像下载