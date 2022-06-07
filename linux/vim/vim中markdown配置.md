vim中进行markdown的编写
<!-- more -->
1. .vimrc中添加插件配置，我用的vundle
    ```
    Plugin 'godlygeek/tabular'  
    Plugin 'plasticboy/vim-markdown'
    ```
    * 这两个用作代码高亮和markdown格式补全
    * 添加之后进入vim，`:PluginInstall`
2. 实时预览  
    一开始用的是vim-instant-markdown，但是浏览器不能自动打开，就放弃了
    改成了国人写的[markdown-preview](https://github.com/iamcco/markdown-preview.vim/blob/master/README_cn.md)，配置简单，一次就成功了，就是需要输命令
    1. 在.vimrc中添加
    	```
        Plugin 'iamcco/mathjax-support-for-mkdp'
        Plugin 'iamcco/markdown-preview.vim'
	```
    2. 添加后进入vim，`:PluginInstall`
    3. 完成后进入md文件，输入`MarkdownPreview`实时预览，输入`MarkdownPreviewStop`停止实时预览
3. 更多配置请看官网https://github.com/iamcco/markdown-preview.vim/blob/master/README_cn.md
  我在配置文件中添加了如下配置
    ```
    " markdown禁用隐藏 "
    let g:vim_markdown_conceal = 0
    " markdown禁用代码栅格隐藏 "
    let g:vim_markdown_conceal_code_blocks = 0
    " markdown禁用折叠 "
    let g:vim_markdown_folding_disabled = 1
    ```
  因为我写的都比较短，自动折叠很烦人，还有代码栅格，没了总觉得怪怪的