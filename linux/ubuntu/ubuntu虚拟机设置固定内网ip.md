1. ubuntu 版本 20.0.4 
2. 在virtualbox和vmware上都经过了测试
3. Ubuntu 20.04 配置网络，默认使用 netplan 方式进行设置
4. netplan 方式的配置为 yaml 格式
    ```
    sudo vim /etc/netplan/00-installer-config.yaml
    ```
5. 修改为如下，其中192.168.31.1是我的路由器的内网的ip，nameservers不一定要设置成路由器，也可以设置成你所在的网络的DNS服务器地址
    ```yaml
    # This is the network config written by 'subiquity'
    network:
        ethernets:
            ens33:
                dhcp4: no
                addresses: [192.168.31.190/24]
                routes:
                    - to: default
                      via: 192.168.1.1
                nameservers:
                    addresses: [192.168.31.1]
        version: 2
    ```
6. 启动服务
    ```
    sudo netplan apply
    ```
7. 查看网络服务的状态
    ```
    networkctl status
    ```
8. 测试状态
    ```
    ping 192.168.31.1
    ping www.baidu.com
    ```
