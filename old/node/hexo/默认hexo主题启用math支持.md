基于默认的`landscape`主题进行数学公式的显示支持

**抄自[Silearner](https://blog.chaos.run/)的博客，未避免以后再进行配置找不到，所以进行记录，望谅解**

# 安装渲染插件
  卸载掉`hexo-renderer-marked`，替换为`hexo-renderer-markdown-it-plus`
  ```bash
  npm un hexo-renderer-marked --save
  npm i hexo-renderer-markdown-it-plus --save
  ```
<!-- more -->
# 修改文章模板
  修改/scaffolds/post.md文件，在----前添加math:false。如果某篇文章想启用数学公式的支持，需将false改为true。
  ```markdown
  ---
  title: {{ title }}
  date: {{ date }}
  tags:
  math: false
  ---
  ```

# 修改主题模板
  有两种选择：
  1. 阅读全文后支持  
  编辑`themes/landscape/layout/_partial/article.ejs`，在`</article>`前加入一行代码，如下所示
  ```
    <% if (!index){ %>
      <%- partial('post/nav') %>
    <% } %>
    <% if (!index && post.math){ %>
      <script>
        var assetsString = '<link href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0/katex.min.css" rel="stylesheet" type="text/css">'
        var pHead = document.getElementsByTagName('head')[0];
        pHead.innerHTML = pHead.innerHTML + assetsString;
      </script>
    <% } %>
  </article>
  ```
  所以要在`<!-- more -->`后添加公式

  2. 直接全部启用支持
  编辑`themes/landscape/layout/_partial/head.ejs`，在`</head>`前加入一行代码，如下所示
  ```
    <link href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0/katex.min.css" rel="stylesheet" type="text/css">
  </head>
  ```

# 编辑配置文件
  在站点配置文件`_config.yml`中加入如下配置
  ```
  markdown_it_plus:
    highlight: true
    html: true
    xhtmlOut: true
    breaks: true
    langPrefix:
    linkify: true
    typographer:
    quotes: “”‘’
    pre_class: highlight
  ```