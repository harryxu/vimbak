" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

runtime! debian.vim

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/gvimrc

source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif


"****************************************************
"*                  自定义配置                      *
"****************************************************

"===== 打开代码高亮=====
syntax enable

"====== 配色方案 ======
colorscheme railscasts
"colorscheme desert

"====== 高亮当前行 =====
set cursorline

"===== 显示行号 =====
set nu

"===== 打开自动缩进 =====
set cindent

"===== 自动缩进站位 =====
set shiftwidth=4

"===== 制表符站位(空格数) ====
set ts=4 

"===== 使用空格替代制表符
set expandtab

"===== 关闭备份 =====
set nobackup 

"===== 高亮搜索 =====
set hlsearch

"==== 编码设定 =====
"set fileencoding=utf-8
"set fileencodings=utf-8,gb18030,utf-16,gb2312,big5

set encoding=utf-8
"language messages zh_CN.UTF-8
"set langmenu=zh_CN.UTF-8
set fileencodings=utf-8,ucs-bom,gb2312,default,latin1

"===== 代码字体和大小 =====
"set guifont=Consolas\ Bold\ 13
"set guifont=Consolas\ 13
set guifont=Monaco\ 10
set gfw=WenQuanYi\Zen\Hei\ 10
set linespace=2 "行距

"==== 搜索忽略大小写 ======"
:set ignorecase

"==== 打开文件即切换到文件所在目录
cd %:h
"set bsdir=buffer

"==== 将F2键映射为取消字符串搜索后的高亮
map <F2> :nohlsearch<CR>

"==== F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

"==== F4 TagList 切换
map <F4> :TlistToggle<CR>
imap <F4> <ESC>:TlistToggle<CR>i

" set up tags
set tags=tags;/
"set tags+=~/.vim/tags/python.ctags
set tags+=~/.vim/tags/django.ctags
"set tags+=~/.vim/tags/zf.ctags


let NERDTreeIgnore=['\.pyc$', '\~$']

"==== ctrl s 保存
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

"==== ctrl v 从剪切板中粘贴
cmap <C-V>		<C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

"==== 插入时间
:imap <C-D> <c-r>=strftime("<%Y-%m-%d %a %H:%M:%S>") . " harry"<CR>

filetype plugin indent on

"==== omni
imap <C-L> <C-x><C-o>

"====  F6下一个tab
:map  <F6> :tabnext<CR>
:nmap  <F6> <ESC>:tabnext<CR>i

"==== F5 运行makefile
:map  <F5> :make<CR>
:imap  <F5> <ESC>:make<CR>i

" hide menu bar and tool bar
"set go-=m
set go-=T


if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    "colorscheme railscasts
else
    "colorscheme default
endif

set completeopt=longest,menu

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "<C-X><C-U>"


" start autocomplpop
if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
endif

let g:AutoComplPop_Behavior['php'] = []
call add(g:AutoComplPop_Behavior['php'], {
        \   'command'   : "\<C-x>\<C-o>", 
        \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
        \   'repeat'    : 0,
        \})

let g:AutoComplPop_Behavior['javascript'] = []
call add(g:AutoComplPop_Behavior['javascript'], {
        \   'command'   : "\<C-x>\<C-o>", 
        \   'pattern'   : printf('\.\k\{%d,}$', 0),
        \   'repeat'    : 0,
        \})
" end autocomplpop
