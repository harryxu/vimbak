if !exists('g:loaded_snips')
	fini
en

exe "Snipp get ${1:public} function get ${2:name}():${3:type}\n{\n\treturn ${4:null};\n}"
exe "Snipp set ${1:public} function set ${2:name}(${3:value}:${4:type}):void\n{\n\t${5}\n}"

" get and set
exe "Snipp gset ${1:public} function get ${2:name}():${3:type}\n{\n\treturn ${4:null};\n}\n"
\. "$1 function set $2(${5:value}:$3):void\n{\n\t${6}\n}"
