"Todo list file
au BufRead,BufNewFile todo.txt,*.todo.txt,recur.txt,*.todo set filetype=todo

" ActionScript
au BufNewFile,BufRead *.mxml    		setfiletype mxml
au BufNewFile,BufRead *.as          	setfiletype actionscript

au BufRead,BufNewFile *.json set filetype=json 

au BufRead,BufNewFile *.hx set filetype=haxe 

" named file
au BufRead,BufNewFile /etc/bind/named.conf* set filetype=named
