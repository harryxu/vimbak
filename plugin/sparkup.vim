" Sparkup
" Installation:
" Put it in ~/.vim/plugin
"
autocmd FileType html,php call KeyMapping()

function! KeyMapping()
    map <C-k> <Esc>:.!sparkup<Cr>:call SparkupNext()<Cr>
    imap <C-k> <Esc>:.!sparkup<Cr>:call SparkupNext()<Cr>
    "map <C-n> <Esc>:call SparkupNext()<Cr>
    "imap <C-n> <Esc>:call SparkupNext()<Cr>
endfunction

function! SparkupNext()
    " 1: empty tag, 2: empty attribute, 3: empty line
    let n = search('><\/\|\(""\)\|^\s*$', 'Wp')
    if n == 3
        startinsert!
    else
        execute 'normal l'
        startinsert
    endif
endfunction
