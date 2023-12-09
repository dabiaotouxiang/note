1. 安装好后选择合适的源
2. 安装提示的语言包
3. sudo apt update && sudo apt upgrade
4. 右键顶部的panel，选择panel perferences，按照xfce-manjaro的进行修改。
5. 打开appearence，进行修改

4. 按照manjaro和xubuntu的Appearnce进行修改，一个一个来
4. 安装papirus图标 
    ```
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt-get update
    sudo apt-get install papirus-icon-theme
    ```
5. 在settings的appearance的icon里面切换icon
6. 在`https://www.pling.com/p/1187179/` 下载matcha-sea，并将里面的三个主题拷贝至`usr/share/themes`，在ettings的appearance的style里面切换matcha-sea
7. apprence中的font修改为如图所示![](./font修改.png)
4. sudo apt install plank 安装dock栏 在设置管理器里面找到Session and Startup（会话和启动），在Application Autostart（应用程序自启动）里面点击Add（添加）按钮，新增Plank登录自启动。