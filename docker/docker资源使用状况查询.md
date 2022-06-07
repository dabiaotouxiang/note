```
docker stats
```
stats 命令会每隔 1 秒钟刷新一次输出的内容直到你按下 ctrl + c

输出内容
```
[CONTAINER]：以短格式显示容器的 ID。
[CPU %]：CPU 的使用情况。
[MEM USAGE / LIMIT]：当前使用的内存和最大可以使用的内存。
[MEM %]：以百分比的形式显示内存使用情况。
[NET I/O]：网络 I/O 数据。
[BLOCK I/O]：磁盘 I/O 数据。
[PIDS]：PID 号。
```

输出指定的容器

可以为 docker stats 命令显式的指定目标容器的名称或者是 ID

```
docker stats --no-stream registry 1493
```

另外还可以格式化输出的结果，具体的内容可以查看[sparkdev的微博](https://www.cnblogs.com/sparkdev/p/7821376.html)