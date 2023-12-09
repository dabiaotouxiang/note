主要为以下几步

1. docker配置好端口映射

我用的是docker-compose,配置-ports
```
-ports
  - "9222:22"
  - "18080:8080"
```
将调试端口和ssh端口都映射出来

2. 启动镜像

3. 进入容器

进入容器，注意用户为root，可以使用docker exec -it -u root xxx bash

4. passwd修改root密码

5. apt-get update

6. apt-get install openssh-server

7. apt-get install openssh-client

8. vim /etc/ssh/sshd_config     下面有的改，没有的添加
```
# PermitRootLogin prohibit-password # 默认打开 禁止root用户使用密码登陆，需要将其注释
RSAAuthentication yes #启用 RSA 认证
PubkeyAuthentication yes #启用公钥私钥配对认证方式
PermitRootLogin yes #允许root用户使用ssh登录
```

9. 启动或者重启ssh

/etc/init.d/ssh restart

10. ssh就已经配置好了，接下来用的什么ide就去配置什么ide的远程调试就可以了