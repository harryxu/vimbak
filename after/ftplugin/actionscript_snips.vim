if !exists('g:loaded_snips')
	fini
en

" get
exe "Snipp get ${1:public} function get ${2:name}():${3:type}\n{\n\treturn ${4:null};\n}"
" set
exe "Snipp set ${1:public} function set ${2:name}(${3:value}:${4:type}):void\n{\n\t${5}\n}"

" get and set
exe "Snipp gset ${1:public} function get ${2:name}():${3:type}\n{\n\treturn ${4:null};\n}\n"
\. "$1 function set $2(${5:value}:$3):void\n{\n\t${6}\n}"

" package
exe "Snipp pkg package ${1}\n{\n${2}\n}"

" class
exe "Snipp cls ${1:public} class ${2:`Filename('', 'ClassName')`} ${3}\n{\n"
\. "\tpublic function $2($4)\n\t{\n\t\t${5}\n\t}\n\n"
\. "\t${6}\n}"


" function
exe "Snipp fn ${1:public} function ${2:fname}(${3}):${4:void}\n{\n\t${5}\n}"
