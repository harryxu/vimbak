" Vim syntax file
" Language:     ActionScript
" Maintainer:   Manish Jethani <manish.jethani@gmail.com>
" URL:          http://geocities.com/manish_jethani/actionscript.vim
" Last Change:  2006 June 26
"
"<2008-09-17 三 21:43:20> harry
" Merged some code from syntax/java.vim for highlight asdoc, by harry.

if exists("b:current_syntax")
  finish
endif

syn region  asStringDQ          start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region  asStringSQ          start=+'+  skip=+\\\\\|\\'+  end=+'+
syn match   asNumber          "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  asRegExp          start=+/+ skip=+\\\\\|\\/+ end=+/[gismx]\?\s*$+ end=+/[gismx]\?\s*[;,)]+me=e-1 oneline
" TODO: E4X

syn keyword asCommentTodo     TODO FIXME XXX TBD contained

syn match   asComment         "//.*$" contains=asCommentTodo
syn region  asComment         start="/\*"  end="\*/" contains=asCommentTodo

syn keyword asDirective       import include
syn match   asDirective       "\<use\s\+namespace\>"

syn keyword asAttribute       public private internal protected override final dynamic native static

syn keyword asDefinition      const var class extends interface implements package namespace
syn match   asDefinition        "\<function\(\s\+[gs]et\)\?\>"

syn keyword asGlobal          NaN Infinity undefined eval parseInt parseFloat isNaN isFinite decodeURI decodeURIComponent encodeURI encodeURIComponent

syn keyword asType            Object Function Array String Boolean Number Date Error RegExp XML
syn keyword asType            int uint void *

syn keyword asStatement       if else do while for with switch case default continue break return throw try catch finally
syn match   asStatement       "\<for\s\+each\>"

syn keyword asIdentifier      super this

syn keyword asConstant        null true false
syn keyword asOperator        new in is as typeof instanceof delete

syn match   asBraces          "[{}]"

" copyed form java syntax file for highlight asdoc

if version < 508
  command! -nargs=+ JavaHiLink hi link <args>
else
  command! -nargs=+ JavaHiLink hi def link <args>
endif

" Comments
syn keyword javaTodo         contained TODO FIXME XXX
syn region  javaComment         start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syn match   javaCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   javaCommentStar      contained "^\s*\*$"
syn match   javaLineComment      "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell
JavaHiLink javaCommentString javaString
JavaHiLink javaComment2String javaString
JavaHiLink javaCommentCharacter javaCharacter

syn cluster javaTop add=javaComment,javaLineComment

if !exists("as_ignore_asdoc")
  syntax case ignore
  " syntax coloring for javadoc comments (HTML)
  syntax include @javaHtml $VIMRUNTIME/syntax/html.vim
  unlet b:current_syntax
  syn region  javaDocComment    start="/\*\*"  end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell
  syn region  javaCommentTitle  contained matchgroup=javaDocComment start="/\*\*"   matchgroup=javaCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@javaHtml,javaCommentStar,javaTodo,@Spell,javaDocTags,javaDocSeeTag

  syn region javaDocTags         contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
  syn match  javaDocTags         contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=javaDocParam
  syn match  javaDocParam        contained "\s\S\+"
  syn match  javaDocTags         contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
  syn region javaDocSeeTag       contained matchgroup=javaDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=javaDocSeeTagParam
  syn match  javaDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
  syntax case match
endif

" match the special comment /**/
syn match   javaComment         "/\*\*/"

" Flex metadata
syn keyword asMetadataTag     Bindable DefaultProperty Effect Event Exclude IconFile MaxChildren ResourceBundle Style contained
syn match   asMetadata        "^\s*\[.*" contains=asMetadataTag,asStringDQ,asComment

syn sync fromstart
syn sync maxlines=300

hi def link asStringDQ        String
hi def link asStringSQ        String
hi def link asNumber          Number
hi def link asRegExp          Special
hi def link asCommentTodo     Todo
hi def link asComment         Comment
hi def link asDirective       Include
hi def link asAttribute       Define
hi def link asDefinition      Structure
hi def link asGlobal          Macro
hi def link asType            Type
hi def link asStatement       Statement
hi def link asIdentifier      Identifier
hi def link asConstant        Constant
hi def link asOperator        Operator
"hi def link asBraces          Function
hi def link asMetadataTag     PreProc


JavaHiLink javaComment          Comment
JavaHiLink javaDocComment       Comment

JavaHiLink javaCommentTitle     SpecialComment
JavaHiLink javaDocTags          Special
JavaHiLink javaDocParam         Function
JavaHiLink javaDocSeeTagParam   Function
JavaHiLink javaCommentStar      javaComment
JavaHiLink javaLineComment      Comment
JavaHiLink javaTodo             Todo

let b:current_syntax = "actionscript"

" vim: ts=8

