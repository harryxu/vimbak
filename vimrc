if g:os == 'win'
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
elseif g:os == 'lnx'
    runtime! debian.vim
    source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    if filereadable("/etc/vim/gvimrc.local")
        source /etc/vim/gvimrc.local
    endif
elseif g:os == 'mac'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号 
set nu

set cursorline

" 隐藏菜单栏和工具栏
"set go-=m
set go-=T
set go+=b

" 搜索忽略大小写 ="
set ignorecase

set hlsearch

set wildmenu

if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    "colorscheme railscasts
else
    "colorscheme default
endif

set completeopt=longest,menu

set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编码设定 
"set fileencoding=utf-8
"set fileencodings=utf-8,gb18030,utf-16,gb2312,big5
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,default,latin1
if g:os == 'win'
    language messages zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/menu.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if g:os == 'win'
    " 代码字体和大小 
    "set guifont=Consolas:h12
    set guifont=Bitstream_Vera_Sans_Mono:h11
    "set guifont=Consolas:h13:b
    "set guifontwide=宋体:h11
    set linespace=0 
elseif g:os == 'lnx'
    "set guifont=Consolas\ Bold\ 13
    "set guifont=Consolas\ 13
    "set guifont=Monaco\ 9
    set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 9
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    set gfw=WenQuanYi\Zen\Hei\ 9
    set linespace=2 
elseif g:os == 'mac'
endif

" 配色方案
colorscheme railscasts

" 打开代码高亮
:syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将F2键映射为取消字符串搜索后的高亮
map <F2> :nohlsearch<CR>

" omni
imap <C-L> <C-x><C-o>

if g:os == 'win'
    " 自动补全符号
    function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
    :inoremap ( ()<ESC>i
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap { {}<ESC>i
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap [ []<ESC>i
    :inoremap ] <c-r>=ClosePair(']')<CR>
endif

" 插入当前时间
:imap <C-D> <c-r>=strftime("<%Y-%m-%d %a %H:%M:%S>") . " harry"<CR>


" 打开文件即切换到文件所在目录
function AlwaysCD()
    if bufname("") !~ "^ftp://"
        lcd %:p:h
    endif
endfunction
autocmd BufEnter * call AlwaysCD()

" ctrl s 保存
noremap <C-S>           :update<CR>
vnoremap <C-S>          <C-C>:update<CR>
inoremap <C-S>          <C-O>:update<CR>

" ctrl v 从剪切板中粘贴
cmap <C-V>              <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>         <C-V>
vmap <S-Insert>         <C-V>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " tab
    """"""""""""""""""""""""""""""
    set expandtab
    set ts=4
    set sw=4
    set sts=4

    """"""""""""""""""""""""""""""
    " indent
    """"""""""""""""""""""""""""""
    "Auto indent
    set ai

    "Smart indet
    set si

    "C-style indeting
    set cindent

    filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " HTML related
    """"""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " Python 
    """"""""""""""""""""""""""""""
    autocmd FileType python set omnifunc=pythoncomplete#Complete

    """"""""""""""""""""""""""""""
    " PHP 
    """"""""""""""""""""""""""""""
    let php_sql_query = 1

    """"""""""""""""""""""""""""""
    " XML 
    """"""""""""""""""""""""""""""
    au BufRead *.xml set wrap



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " Tag list
    """"""""""""""""""""""""""""""
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    map <F4> :Tlist<CR>
    imap <F4> <ESC>:Tlist<CR>

    " ctags
    set tags=tags;/
    set tags+=$VIMRUNTIME/tags/python.ctags
    set tags+=$VIMRUNTIME/tags/django.ctags

    """"""""""""""""""""""""""""""
    " NERDTree 
    """"""""""""""""""""""""""""""
    map <F3> :NERDTreeToggle<CR>
    imap <F3> <ESC>:NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\~$', 
                \ '\.pyc$', '\.exe$', '\.dll$', 
                \ '\.jpg$', '\.png$', '\.gif$']

    """"""""""""""""""""""""""""""
    " autocomplpop
    """"""""""""""""""""""""""""""
    if !exists('g:AutoComplPop_Behavior')
        let g:AutoComplPop_Behavior = {}
    endif

    " php
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
                \   'command'   : "\<C-x>\<C-o>",
                \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
                \   'repeat'    : 0,
                \})

    " javascript
    let g:AutoComplPop_Behavior['javascript'] = []
    call add(g:AutoComplPop_Behavior['javascript'], {
                \   'command'   : "\<C-x>\<C-o>",
                \   'pattern'   : printf('\.\k\{%d,}$', 0),
                \   'repeat'    : 0,
                \})
 

