if !exists('loaded_snips')
	fini
en

exe "Snip main public static void main (String [] args)\n{\n\t${1:/* code */}\n}"
exe 'Snip pu public'
exe 'Snip po protected'
exe 'Snip pr private'
exe 'Snip st static'
exe 'Snip fi final'
exe 'Snip ab abstract'
exe 'Snip re return'
exe 'Snip br break;'
exe "Snip de default:\n\t${1}"
exe 'Snip ca catch(${1:Exception} ${2:e}) ${3}'
exe 'Snip th throw '
exe 'Snip sy synchronized'
exe 'Snip im import'
exe 'Snip j.u java.util'
exe 'Snip j.i java.io.'
exe 'Snip j.b java.beans.'
exe 'Snip j.n java.net.'
exe 'Snip j.m java.math.'
exe 'Snip if if (${1}) ${2}'
exe 'Snip el else '
exe 'Snip elif else if (${1}) ${2}'
exe 'Snip wh while (${1}) ${2}'
exe 'Snip for for (${1}; ${2}; ${3}) ${4}'
exe 'Snip fore for (${1} : ${2}) ${3}'
exe 'Snip sw switch (${1}) ${2}'
exe "Snip cs case ${1}:\n\t${2}\n${3}"
exe 'Snip tc public class ${1:`Filename()`} extends ${2:TestCase}'
exe 'Snip t public void test${1:Name}() throws Exception ${2}'
exe 'Snip cl class ${1:`Filename("", "untitled")`} ${2}'
exe 'Snip in interface ${1:`Filename("", "untitled")`} ${2:extends Parent}${3}'
exe 'Snip m ${1:void} ${2:method}(${3}) ${4:throws }${5}'
exe 'Snip v ${1:String} ${2:var}${3: = null}${4};${5}'
exe 'Snip co static public final ${1:String} ${2:var} = ${3};${4}'
exe 'Snip cos static public final String ${1:var} = "${2}";${3}'
exe 'Snip as assert ${1:test} : "${2:Failure message}";${3}'
