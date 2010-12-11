" Vim syntax file
" Language: jQuery Templates
" Maintainer: David Zhou <dz@disqus.com>
" Last Change: Dec 2010

if exists("b:current_syntax")
    finish
endif

"keywords
syn keyword jTmplCommands each else if wrap html containedin=jTmplCommandRegion 

"{{ }} region
syn region jTmplCommandRegion start=+{{+ keepend end=+}}+ contains=jTmplCommands 

"${var} variable
syn match jTmplVariable '\${[^}]*}' containedin=javaScriptStringS,javaScriptStringD,htmlString
syn match jTmplVariableShortcut '{{=[^}]*}}' containedin=javaScriptStringS,javaScriptStringD,htmlString

syn cluster jTmplAll contains=jTmplVariable,jTmplVariableShortcut

"include django and html syntaxes
runtime! syntax/html.vim
if exists("g:jquerytmpl_django")
    runtime! syntax/django.vim
endif
unlet b:current_syntax
let b:current_syntax = "jquerytmpl"

"hilighting
command! -nargs=+ JTmplHiLink hi def link <args>

JTmplHiLink jTmplVariable Identifier
JTmplHiLink jTmplVariableShortcut Identifier
JTmplHiLink jTmplCommands Statement
JTmplHiLink jTmplCommandRegion Identifier

delcommand JTmplHiLink
