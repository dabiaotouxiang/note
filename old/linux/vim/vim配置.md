贴出当前的vim配置，pycharm实在是有点耗资源
<!-- more -->
## .vimrc配置
```vim
set backspace=2 "设置退格键生效
set nu "设置行号显示
syntax enable "设置语法高亮

" 配置py文件的设置
au BufNewFile,BufRead *.py
    \ set tabstop=4     | 
    \ set softtabstop=4     |
    \ set shiftwidth=4     |
    \ set textwidth=79     |
    \ set expandtab     |
    \ set autoindent     |
    \ set fileformat=unix

" 配置c文件的设置
au BufNewFile,BufRead *.c
    \ set tabstop=4 |
	\ set shiftwidth=4

" 配置md文件的设置
au BufNewFile,BufRead *.md
    \ set tabstop=4 

" vundle配置
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" markdown配置
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" markdown实时预览
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
" python自动补全
Plugin 'Valloric/YouCompleteMe'
" 文件树
Plugin 'scrooloose/nerdtree'
" 状态栏
Plugin 'https://github.com/bling/vim-airline'
" 代码检查工具
Plugin 'dense-analysis/ale'
" tab线
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

" markdown禁用代码隐藏
let g:vim_markdown_conceal = 0
" markdown禁用代码栅格隐藏
let g:vim_markdown_conceal_code_blocks = 0
" markdown禁用折叠
let g:vim_markdown_folding_disabled = 1

" 文件树
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
"显示隐藏文件
let NERDTreeShowHidden=1

" 代码检查
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" 一键执行
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
	elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
	elseif &filetype == 'sh'
            :!time bash %
	elseif &filetype == 'python'
            exec "!time python3.6 %"
	elseif &filetype == 'html'
            exec "!firefox % &"
	elseif &filetype == 'go'
    	    "exec "!go build %<"
            exec "!time go run %"
	endif
    endfunc
```

在安装ycm的时候，plugin安装完毕，还要在目录下进行./install.py安装，若想支持c语言，需要./install.py --clang-completer

## 实际使用YCM
  YCM默认是支持python的，如果想用项目的虚拟环境的话，有两种配置方法
  1. 在项目的根目录添加一个文件`.ycm_extra_conf.py`
  ```python
  def Settings( **kwargs ):
  return {
    'interpreter_path': '/path/to/virtual/environment/python'
  }
  ```
  2. 在vim中进行全局配置
  在vimrc中添加
  ```
  let g:ycm_python_interpreter_path = ''
  let g:ycm_python_sys_path = []
  let g:ycm_extra_conf_vim_data = [
    \  'g:ycm_python_interpreter_path',
    \  'g:ycm_python_sys_path'
    \]
  let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
  ```
  添加`~/global_extra_conf.py`文件
  ```python
  def Settings( **kwargs ):
  client_data = kwargs[ 'client_data' ]
  return {
    'interpreter_path': client_data[ 'g:ycm_python_interpreter_path' ],
    'sys_path': client_data[ 'g:ycm_python_sys_path' ]
  }
  ```
## 配置YCM对C的补全
  在YCM中使用C的自动补全，我是主用python，用C的话比较简单的一个方式就是在项目的根目录新建一个文件为`.ycm_extra_conf.py`
  ```python
  def Settings( **kwargs ):
  return {
    'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ],
  }
  ```
  在.vimrc中配置`let g:ycm_confirm_extra_conf = 0`可以让vim不再每次打开时询问是否加载项目根目录配置，而是直接加载项目根目录的配置
