前几天为了差一个问题，想看有没有内存泄露的报告的时候，发现`/var/log/`目录下没有messages日志文件

上网查了查，需要对ubuntu的日志设置进行一些修改

```
less /etc/rsyslog.d/50-default.conf 
```

找到有关messages的部分
```
#*.=info;*.=notice;*.=warn;\
#       auth,authpriv.none;\
#       cron,daemon.none;\
#       mail,news.none          -/var/log/messages
```

vim 去掉注释并退出

重启日志服务
```
service rsyslog restart
```

就可以了

[原文链接](https://blog.csdn.net/symptoms216/article/details/79635700)