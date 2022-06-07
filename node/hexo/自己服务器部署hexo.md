系统ubuntu-server-18

1. 新建git仓库
```
apt install git
cd /data/
mkdir blog.git
cd blog.git
git init --bare
```

2. 本地的hexo的文件夹
```
vi _config.yml
```
修改内容，注意配置好ssh，或者每次都输入密码
```
deploy:

    type: git

    message: update

    repo: yourusername@server_ip:~/path/to/your/blog.git
```

3. 本地hexo文件夹hexo clean

4. 本地hexo文件夹hexo g

5. 本地hexo文件夹hexo d

6. 远程设置的blog.git仓库
```
cd /path/to/your/blog.git/hooks

touch post-receive

vim post-receive
```
填写如下内容
```
#!/bin/bash -l

GIT_REPO=/pathtoyourgit/blog.git

# 手动创建，位置随便，但是要记住
TMP_GIT_CLONE=/tmp/blog

# 手动创建，位置随便，但是要记住
PUBLIC_WWW=/project/blog

rm -rf ${TMP_GIT_CLONE}

git clone $GIT_REPO $TMP_GIT_CLONE

rm -rf ${PUBLIC_WWW}

cp -rf ${TMP_GIT_CLONE} ${PUBLIC_WWW}
```
然后
```
chmod +x post-receive

chmod 777 -R /path/to/your/blog
```

7. 修改nginx配置
```
server {

    listen 80 ;

    root 上文配置的PUBLIC_WWW;

    server_name 你的域名;

    access_log  /home/ubuntu/nginxlog/blog_access.log;

    error_log  /home/ubuntu/nginxlog/blog_error.log;

    location / {

        root 上文配置的PUBLIC_WWW;

        if (-f $request_filename) {

            rewrite ^/(.*)$  /$1 break;

        }

    }

}
```

8. 重启nginx

9. hexo重新上传一次，就可以访问了

原文: [如何在个人服务器上部署Hexo博客](https://www.jianshu.com/p/196773379a78)