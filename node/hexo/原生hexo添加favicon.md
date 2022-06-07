原生的hexo如何添加Favicon
<!-- more -->

1. 网络上搜索Favicon生成，生成32*32的ico图片
2. 将图片放入themes/landscape/source/favicon.ico目录
3. 部署
```bash
hexo clean
hexo g
hexo d
```
4. 可能需要将浏览器缓存清除一下，然后再能看到
5. 图片放置位置可以根据themes/landscape/_config.yml里的favicon进行配置