1. 在git上找到boringssl进行编译  https://github.com/dabiaotouxiang/boringssl.git 
2. 适配boringssl到cryptography，手动编译安装  https://github.com/dabiaotouxiang/cryptography.git
3. pyopenssl 合适的版本下载安装  https://github.com/dabiaotouxiang/pyopenssl.git
4. mitmproxy合适的版本下载安装。  https://github.com/dabiaotouxiang/mitmproxy.git
5. 然后就得到了boringssl编译的mitmproxy
6. 可以参照这个脚本进行ssl指纹的修改 startmitm.py
    ```
    python startmitm.py proxy 启动proxy
    python startmitm.py web 启动web
    ```