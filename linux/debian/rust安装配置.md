1. curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
2. 验证 rustc -V
3. 推出重新进入terminal来激活


加速配置
1. `vim ~/.cargo/config`
2. 添加代理
    ```conf
    [http]
    proxy = "socks5://192.168.0.1:23456"
    [https]
    proxy = "socks5://192.168.0.1:23456"
    ```