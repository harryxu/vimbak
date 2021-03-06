"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

if has('Win32')
    source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/../vimfiles/mswin.vim
    behave mswin
else
    runtime! debian.vim
    source $VIMRUNTIME/vimrc_example.vim
    if filereadable("/etc/vim/gvimrc.local")
        source /etc/vim/gvimrc.local
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set to auto read when a file is changed from the outside
"set autoread

"Have the mouse enabled all the time:
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号 
set nu

"set cursorline

if !has('Win32')
    set list
    set listchars=tab:·\ ,eol:¬
endif


" 隐藏菜单栏和工具栏
"set go-=m
set go-=T

" 横向滚动条
"set go+=b

" 搜索忽略大小写 ="
set ignorecase

set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom
 
set incsearch "find the next match as we type the search
set hlsearch "hilight searches by default

set wildmenu
set completeopt=menuone,longest

set sessionoptions-=options

"set nowrap
" wrapping text
set wrap linebreak

"statusline setup
set statusline=%f "tail of the filename
 
"display a warning if fileformat isnt unix
set statusline+=\ [%{&ff}]
 
"display file encoding
set statusline+=[%{&fenc}]
 
set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
 
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
 
set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=\ %l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

set nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编码设定 
"set fileencoding=utf-8
"set fileencodings=utf-8,gb18030,utf-16,gb2312,big5
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,gb18030,cp936,default,latin1
if has('Win32')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.UTF-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('Win32')
    " 代码字体和大小 
    "set guifont=YaHei_Consolas_Hybrid:h10.5
    "set guifont=Bitstream_Vera_Sans_Mono:h11
    set guifont=Inconsolata:h12
    set linespace=1 
else
    "set guifont=Consolas\ Bold\ 13
    "set guifont=Consolas\ 13
    "set guifont=Monaco\ Bold\ 11
    "set guifont=Monaco\ 10
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 12
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    "set guifont=Inconsolata\ 15
    set guifont=Anonymous\ Pro\ Bold\ 12
    set gfw=WenQuanYi\Micro\Hei\ 12
    "set gfw=WenQuanYi\Zen\Hei\ 11
    set linespace=2 
endif

" 打开代码高亮
syntax enable

" 配色方案
if (has('Win32'))
    colorscheme fu
elseif (has('gui_running'))
    colorscheme railscasts
else
    colorscheme darkblue
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将F2键映射为取消字符串搜索后的高亮
map <F2> :nohlsearch<CR>

" omni
"imap <C-L> <C-x><C-o>

" 插入当前时间
:imap <C-D> <c-r>=strftime("<%Y-%m-%d %a %H:%M:%S>") . " harry"<CR>


" 打开文件即切换到文件所在目录
set autochdir

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

" Ctrl c 复制到剪切板
vnoremap <C-C> "+y

" move on windows
map <C-I> <C-W>k
map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-L> <C-W>l

" windows move
set winaltkeys=no
map <A-k> <C-W>K
map <A-j> <C-W>J
map <A-h> <C-W>H
map <A-l> <C-W>L

" map ctrl j to esc
imap <C-j> <ESC>
vmap <C-j> <ESC>

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
    "set cindent

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
    "autocmd FileType python set omnifunc=pythoncomplete#Complete

    """"""""""""""""""""""""""""""
    " PHP 
    """"""""""""""""""""""""""""""
    "let php_sql_query = 1
    let php_alt_blocks = 0
    au FileType php imap ,, ->
    "let php_strict_blocks = 0

    """"""""""""""""""""""""""""""
    " XML 
    """"""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " diff 
    """"""""""""""""""""""""""""""
    au FileType diff colorscheme railscasts

    """"""""""""""""""""""""""""""
    " yaml,xml,html 使用2个空格作为缩进 
    """"""""""""""""""""""""""""""
    autocmd FileType html,htmldjango,css,xml,yaml setlocal ts=2 sts=2 sw=2 expandtab


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

    """"""""""""""""""""""""""""""
    " NERDTree 
    """"""""""""""""""""""""""""""
    map <F3> <ESC>:NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\~$', 
                \ '\.pyc$', '\.exe$', '\.dll$', 
                \ '\.jpg$', '\.png$', '\.gif$',
                \ '\.swf$', '\.fla$', '\.o$']

    """"""""""""""""""""""""""""""
    " snipMate 
    """"""""""""""""""""""""""""""
    " fix snippets_dir on windows

    au BufRead *.snippets :set nofoldenable

    """"""""""""""""""""""""""""""
    " fuzzy finder
    """"""""""""""""""""""""""""""
    nmap ,b :FufBuffer<CR>
    nmap ,f :FufFile<CR>
    nmap ,d :FufDir<CR>
    
    """"""""""""""""""""""""""""""
    " xmledit
    """"""""""""""""""""""""""""""
    " jump to the beginning or end of the tag block 
    au FileType xml,html,xhtml nmap <C-M> <LocalLeader>%

    """"""""""""""""""""""""""""""
    " miniBufExpl
    """"""""""""""""""""""""""""""
    let g:miniBufExplMapCTabSwitchBufs = 1 

    """"""""""""""""""""""""""""""
    " phpDocumentor
    """"""""""""""""""""""""""""""
    nmap <C-P> :call PhpDocSingle()<CR> 

    """"""""""""""""""""""""""""""
    " autocomplpop
    """"""""""""""""""""""""""""""
    let g:acp_enableAtStartup = 0

    if !exists('g:AutoComplPop_Behavior')
        let g:AutoComplPop_Behavior = {}
    endif

    """"""""""""""""""""""""""""""
    " => bufExplorer plugin
    """"""""""""""""""""""""""""""
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1


    """"""""""""""""""""""""""""""
    " => Minibuffer plugin
    """"""""""""""""""""""""""""""
    let g:miniBufExplModSelTarget = 0
    "let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplVSplit = 25
    let g:miniBufExplSplitBelow=1
    let g:miniBufExplorerAutoUpdate = 0


    let g:bufExplorerSortBy = "name"

    "autocmd BufRead,BufNew :call UMiniBufExplorer

    map <F5> :TMiniBufExplorer<CR>

    """"""""""""""""""""""""""""""
    " => SuperTab
    """"""""""""""""""""""""""""""
    "let g:SuperTabMappingForward = '<C-J>'
        
    """"""""""""""""""""""""""""""
    " => Zen Coding
    """"""""""""""""""""""""""""""
    let g:user_zen_settings = {
    \    'indentation' : '  ',
    \}
    let g:user_zen_expandabbr_key = '<C-K>'
    "let g:use_zen_complete_tag = 1

    """"""""""""""""""""""""""""""
    " => NeoComplCache
    """"""""""""""""""""""""""""""
    " Use neocomplcache. 
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase. 
    let g:NeoComplCache_SmartCase = 1

    "let g:neocomplcache_disable_auto_complete = 1
    "

    """"""""""""""""""""""""""""""
    " => Session manager
    """"""""""""""""""""""""""""""
    let g:session_autosave = 1
