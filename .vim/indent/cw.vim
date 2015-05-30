"if exists("b:did_indent")
"    finish
"endif
"let b:did_indent = 1
"
"" Now, set up our indentation expression and keys that trigger it.
"setlocal indentexpr=GetCwIndent()
"setlocal indentkeys=0{,0},0),0[,0],!^F,o,O,e,:
"setlocal indentkeys+=if,=else,=foreach,=select,=switch
"
"setlocal nosmartindent
"
"" Only define the function once.
""if exists("*GetRubyIndent")
""  finish
""endif
"
"" 1. Variables {{{1
"" ============
"
"" regex used for words that, at the start of a line, add a level of indent
""let s:cw_indent_words =
"   
"
"" regex used for words that, at the start of a line, remove a level of indent
"let s:cw_desindent_words =
"  \ '^\s*\zs\<\%(else\|while\)\>'
if exists("b:did_indent") | finish | endif
  let b:did_indent = 1
