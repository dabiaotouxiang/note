当我们将配置中的部署方式改为git后，使用hexo d 时会报错

<!-- more -->
出现找不到git是因为缺少git的插件

`npm install hexo-deployer-git --save`

在博客的目录下使用该命令即可