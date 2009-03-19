if !exists('loaded_snips') || exists('s:did_xml_snips')
	fini
en
let s:did_xml_snips = 1
let snippet_filetype = 'xml'

exe "Snipp xml <?xml version=\"1.0\" encoding=\"utf-8\"?>\n${1}"

"----------------
"   DocBook
"----------------
exe "Snipp docbk <book>\n\t<bookinfo>\n\t\t"
    \."<title>${1:title}</title>\n\t\t"
    \."<author>\n\t${2}\n</author>\n\t</bookinfo>\n</book>"

" DocBook DTD
exe "Snipp docbkdtd <!DOCTYPE book PUBLIC \"-//OASIS//DTD DocBook XML V${1:4.5}//EN\"\n\t"
    \."\"http://www.oasis-open.org/docbook/xml/$1/docbookx.dtd\">\n${2}"
