" Vim colour scheme
" Maintainer:   Georg Dahn
" Last Change:  26 April 2006
" Version:  1.6
"
" This color scheme has both light and dark styles with harmonic colors
" easy to distinguish. Terminals are not supported, therefore you should
" only try it if you use the GUI version of Vim.
"
" You can choose the style by adding one of the following lines to your
" vimrc or gvimrc file before sourcing the color scheme:
"
" let g:sienna_style = 'dark'
" let g:sienna_style = 'light'
"
" If none of above lines is given, the light style is choosen.
"
" You can switch between these styles by using the :Colo command, like
" :Colo dark or :Colo light (many thanks to Pan Shizhu).

if exists("g:sienna_style")
    let s:sienna_style = g:sienna_style
else
    let s:sienna_style = 'light'
endif

execute "command! -nargs=1 Colo let g:sienna_style = \"<args>\" | colo sienna"

if s:sienna_style == 'dark'
    set background=dark
elseif s:sienna_style == 'light'
    set background=light
else
    finish
endif

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'sienna'

hi Normal gui=none guifg=Black guibg=#FFFFFF

hi Cursor guifg=White guibg=Black
hi LineNr gui=none guifg=#666666 guibg=#CCCCCC
hi NonText gui=bold guifg=DarkGray guibg=Grey95
hi SpecialKey gui=none guifg=RoyalBlue4
hi Title gui=bold guifg=Black
hi Visual gui=none guibg=SkyBlue

hi FoldColumn gui=none guifg=Black guibg=Wheat2
hi Folded gui=none guifg=Black guibg=Wheat1
hi StatusLine gui=bold guifg=White guibg=Black
hi StatusLineNC gui=none guifg=White guibg=DimGray
hi VertSplit gui=none guifg=White guibg=DimGray
hi WildMenu guibg=#ffff00 guifg=fg gui=bold

hi Pmenu guibg=#EDEFE0 guifg=#000000 gui=none
hi PmenuSbar guibg=#808080 guifg=fg gui=none
hi PmenuThumb guibg=#c0c0c0 guifg=fg gui=none
hi PmenuSel guibg=#1D719F guifg=#FFFFFF gui=none


hi IncSearch gui=none guifg=White guibg=Black
hi Search gui=none guifg=Black guibg=Yellow

hi MoreMsg gui=bold guifg=ForestGreen
hi Question gui=bold guifg=ForestGreen
hi WarningMsg gui=bold guifg=Red

hi Comment gui=italic guifg=DarkGreen
hi Error gui=none guifg=White guibg=Red
hi Identifier gui=none guifg=Black
hi Special gui=none guifg=Blue
hi PreProc gui=none guifg=RoyalBlue3
hi Todo gui=bold guifg=Black guibg=Yellow
hi Type gui=none guifg=#0036FF
hi Underlined gui=underline guifg=Blue

hi Boolean gui=bold guifg=RoyalBlue4
hi Constant gui=none guifg=#AE25AB
hi Number gui=none guifg=Black
hi String gui=none guifg=DarkRed

hi Label gui=none guifg=#FF3300
hi Statement gui=none guifg=#0033ff
hi Function gui=none guifg=#AE25AB

" {} () 
hi phpParent            guifg=Black   gui=none
hi phpFunctions         guifg=#AE25AB gui=NONE
hi phpSpecialFunction   guifg=#AE25AB gui=NONE
hi phpEcho              guifg=#AE25AB gui=NONE

hi pythonBuiltin guifg=#AE25AB gui=NONE

hi xmlTag        guifg=#AE25AB ctermfg=179 gui=NONE
hi xmlTagName    guifg=#AE25AB ctermfg=179 gui=NONE
hi xmlEndTag     guifg=#AE25AB ctermfg=179 gui=NONE

hi htmlTag       guifg=#666666 ctermfg=179 gui=NONE
hi htmlTagName   guifg=#AE25AB ctermfg=179 gui=NONE
hi htmlEndTag    guifg=#666666 ctermfg=179 gui=NONE
hi htmlArg       guifg=DarkBlue gui=none
hi htmlBold gui=bold
hi htmlItalic gui=italic
hi htmlUnderline gui=underline
hi htmlBoldItalic gui=bold,italic
hi htmlBoldUnderline gui=bold,underline
hi htmlBoldUnderlineItalic gui=bold,underline,italic
hi htmlUnderlineItalic gui=underline,italic

