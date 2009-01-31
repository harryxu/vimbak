" Vim filetype plugin file
" Language:	Java
" Maintainer:	Dan Sharp <dwsharp at hotmail dot com>
" Last Change:  2005 Mar 28
" URL:		http://mywebpage.netscape.com/sharppeople/vim/ftplugin
" copyed form ftplugin/java.vim just for as doc

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

" Enable gf on import statements.  Convert . in the package
" name to / and append .java to the name, then search the path.
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.java

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal formatoptions-=t formatoptions+=croql

" Set 'comments' to format dashed lists in comments. Behaves just like C.
setlocal comments& comments^=sO:*\ -,mO:*\ \ ,exO:*/

setlocal commentstring=//%s

" Undo the stuff we changed.
let b:undo_ftplugin = "setlocal suffixes< suffixesadd<" .
		\     " formatoptions< comments< commentstring< path< includeexpr<" .
		\     " | unlet! b:browsefilter"

" Restore the saved compatibility options.
let &cpo = s:save_cpo
