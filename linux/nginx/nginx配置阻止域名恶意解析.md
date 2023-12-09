今天在谷歌搜索的时候发现一个不认识的域名指向了自己的ip，于是就查了一下这个情况，发现是域名恶意解析，具体的情况可以看这个[恶意域名解析](https://cloud.tencent.com/developer/article/1494534)

下面说一下解决办法:
<!--more-->

1. nginx配置
在nginx.conf中配置，自己的域名在单独的server配置文件中配置
```
server {

    listen       80  default_server;
    server_name  _;
    return      403;
}
或者
server {
    listen       80  default_server;
    server_name  "";
    return      403;
}
或者 下面的域名会将恶意解析的域名跳转到自己的域名，流量就会回归到自己的域名
server {
    listen       80  default_server;
    server_name  "";
    return      301 自己的域名;
}
```

此外还有其他的tomcat和apache服务器的配置方法，可以自行搜索