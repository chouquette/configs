" Language:	CodeWorker	
" Maintainer:	CHAVANCE Clement <chavance.c@gmail.com>
" Last Change:	2007 Oct 21	
" Remark:	CodeWorker syntax highlight

"Checking if some files were already loaded for this fileType
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the cws syntax to start with
if version < 600
  so <sfile>:p:h/cws.vim
else
  runtime! syntax/cws.vim
endif


syn region	cwMacro			start=/#\(\<\|!\<\)/ end=/\>/ 
"syn region	cwBlock			start=/\[/ end=/\]/ contains=cwBlock
"syn region	cwRule			start=/::\=/ end=/;/ contains=cwBlock

"define the default highlighting

hi def link	cwMacro		Statement
hi def link	cwComment	Comment

"syn match cwMetaIdentifier /[A-Za-z]/ skipwhite skipempty nextgroup=cwSeperator
"
"syn match cwSeperator "=" contained nextgroup=cwProduction skipwhite skipempty
"
"syn region cwProduction start=/\zs[^\.;]/ end=/[\.;]/me=e-1 contained contains=cwSpecial,cwDelimiter,cwTerminal,cwSpecialSequence,cwComment nextgroup=cwEndProduction skipwhite skipempty
"syn match cwDelimiter #[,(|)\]}\[{/!]\|\(\*)\)\|\((\*\)\|\(/)\)\|\(:)\)\|\((/\)\|\((:\)# contained
"syn match cwSpecial /[\-\*]/ contained
"syn region cwSpecialSequence matchgroup=Delimiter start=/?/ end=/?/ contained
"syn match cwEndProduction /[\.;]/ contained 
"syn region cwTerminal matchgroup=delimiter start=/"/ end=/"/ contained
"syn region cwTerminal matchgroup=delimiter start=/'/ end=/'/ contained
"syn region cwComment start="(\*" end="\*)"
"
"
"hi link cwComment Comment
"hi link cwMetaIdentifier Identifier
"hi link cwSeperator cwSpecial
"hi link cwEndProduction cwDelimiter
"hi link cwDelimiter Delimiter
"hi link cwSpecial Special
"hi link cwSpecialSequence Statement
"hi link cwTerminal Constant
