# hexo server启动并允许外网访问
<!-- more -->
因为我是在服务器运行hexo server发现运行后显示的是

> Hexo is running at http://localhost:4000 . Press Ctrl+C to stop.

当时就认为localhost就只能在本机访问，后来发现在电脑端也能访问

```bash
hexo server -i 0.0.0.0
```

发现也是显示的

>Hexo is running at http://localhost:4000 . Press Ctrl+C to stop.

可能hexo默认的localhost是0.0.0.0吧