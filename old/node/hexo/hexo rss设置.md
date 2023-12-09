## RSS是什么可以百度
<!-- more -->
1. 进入blog的文件目录

2. 安装 hexo-generator-feed

   `npm install hexo-generator-feed`
  
3. 在blog的目录下，在_config.yml中添加配置
  ```
  feed:
    type: atom
    path: atom.xml
    limit: 20
    hub:
    content:
    content_limit:
    content_limit_delim:
  ```
  * type:RSS的类型
  * path:rss文件的路径，默认即可
  * limit:展示文章的数量，0或者false代表全部
  * 其他的默认就可以