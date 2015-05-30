" Language:	CodeWorker	
" Maintainer:	CHAVANCE Clement <chavance.c@gmail.com>
" Last Change:	2007 Oct 21	
" Remark:	CodeWorker script syntax highlight


"TODO Check comment block in script block

"Checking if some files were already loaded for this fileType
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"setting the syntax highlight to case sensitive
syn case match

"Keywords

" Type
syn keyword 	cwsType					value node iterator ref
syn keyword 	cwsDeclaration			local 

" Conditionals
syn keyword	cwsConditional				if else switch contained

" Repeat
syn keyword	cwsRepeat					do while forfile foreach contained

" Boolean
syn keyword cwsBoolean					true false

" Tree management
syn keyword	cwsTreeManagement			insert pushItem setall merge

syn keyword	cwsMisc						return this

syn keyword cwsTreeAccess				#back #front #root #parent

" Functions
syn keyword	cwsFunctionDecl		function
syn keyword	cwsFuntionWord		acceptSocket add addGenerationTagsHandler addToDate allFloatingLocations appendFile attachInputToSocket attachOutputToSocket bytesToLong bytesToShort byteToChar canonizePath ceil changeDirectory changeFileTime charAt charToByte charToInt chmod clearVariable closeSocket compareDate compileToCpp completeDate completeLeftSpaces completeRightSpaces composeAdaLikeString composeCLikeString composeHTMLLikeString composeSQLLikeString computeMD5 copyFile copyGenerableFile copySmartDirectory copySmartFile coreString countInputCols countInputLines countOutputCols countOutputLines countStringOccurences createDirectory createINETClientSocket createINETServerSocket createIterator createReverseIterator createVirtualFile createVirtualTemporaryFile cutString decodeURL decrement decrementIndentLevel deleteFile deleteVirtualFile detachInputFromSocket detachOutputFromSocket div duplicateIterator encodeURL endl endString environTable equal equalLastWrittenChars equalsIgnoreCase equalTrees error executeString executeStringQuiet existEnv existFile existFloatingLocation existVariable existVirtualFile exp expand exploreDirectory fileCreation() fileLastAccess fileLastModification fileLines fileMode fileSizefindElement findFirstChar findFirstSubstringIntoKeys findLastString findNextString findNextSubstringIntoKeys findString first floor flushOutputToSocket formatDate generate generateString getArraySize getCommentBegin getCommentEnd getCurrentDirectory getEnv getFloatingLocation getGenerationHeader getHTTPRequest getIncludePath getInputFilename getInputLocation getLastDelay getLastReadChars getLastWrittenChars getMarkupKey getMarkupValue getNow getOutputFilename getOutputLocation getProperty getProtectedArea getProtectedAreaKeys getShortFilename getTextMode getVariableAttributes getVersion getWorkingPath getWriteMode goBack hexaToDecimal hostToNetworkLong hostToNetworkShort increment incrementIndentLevel indentFile indentText index inf inputKey inputLine insertElementAt insertText insertTextOnce insertTextOnceToFloatingLocation insertTextToFloatingLocation invertArray isEmpty isIdentifier isNegative isNumeric isPositive joinStrings key last leftString lengthString listAllGeneratedFiles loadBinaryFile loadFile loadVirtualFile log longToBytes lookAhead midString mod mult networkLongToHost networkShortToHost newFloatingLocation next not octalToDecimal openLogFile overwritePortion parseAsBNF parseFree parseFreeQuiet parseStringAsBNF pathFromPackage peekChar populateProtectedArea postHTTPRequest pow prec produceHTML putEnv randomInteger randomSeed readAdaString readByte readBytes readCChar readChar readCharAsInt readChars readIdentifier readIfEqualTo readIfEqualToIdentifier readIfEqualToIgnoreCase readLine readNextText readNumber readPythonString readString readUptoJustOneChar readWord receiveBinaryFromSocket receiveFromSocket receiveTextFromSocket relativePath remainingProtectedAreas removeAllElements removeDirectory removeElement removeFirstElement removeFloatingLocation removeGenerationTagsHandler removeLastElement removeProtectedArea removeRecursive removeVariable repeatString replaceString replaceTabulations resizeOutputStream resolveFilePath rightString rsubString saveBinaryToFile saveProject saveProjectTypes saveToFile scanDirectories scanFiles setCommentBegin setCommentEnd setFloatingLocation setGenerationHeader setIncludePath setInputLocation setNow setOutputLocation setProperty setProtectedArea setTextMode setVersion setWorkingPath setWriteMode shortToBytes skipBlanks skipEmptyCpp skipEmptyCppExceptDoxygen skipEmptyHTML skipEmptyLaTeX sleep slideNodeContent sortArray sqrt startString sub subString sup system toLowerString toUpperString traceEngine traceLine traceObject traceStack traceText translate translateString trim trimLeft trimRight truncateAfterString truncateBeforeString UUID writeBytes writeText writeTextOnce

syn cluster	cwsFunction		contains=cwsFuntionWord,cwsFunctionDecl
syn cluster	cwsScript		contains=cwsType,cwsDeclaration,cwsRepeat,cwsConditional,cwsString,cwsEvalexpr,cwsInsertVar,cwsComment,cwsChar,cwsInsert,cwsEvalexpr,cwsCommentBlock,cwsBoolean,cwsTreeManagement,cwsMisc,cwsDec,cwsFloat,cwsTreeAccess


"	NUMBERS
syn	match	cwsDec			"\<\d[0-9]*\>"	
syn match	cwsFloat		"\<\d[0-9]*\.[0-9]*\>"


"Regions
syn region	cwsString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell,cwsEscSequence
syn region	cwsEvalexpr		start=/\$/ end=/\$/
syn region	cwsInsertVar		start=/@/ end=/@/ contained
syn region	cwsInsert		start=/%>/ end=/<%/ contains=cwsInsertVar

" Characters
"
syn match cwsSpecialCharError contained "[^']"

" Escape sequences (character entities)
syn match cwsEscSequence	"\\[\"\\'\\?ntbrfva]" contained
syn match cwsCharacter	"'[^']*'" contains=cwsEscSequence,cwsSpecialCharError
syn match cwsCharacter	"'\\''" contains=cwsEscSequence
syn match cwsCharacter	"'[^\\]'"

"Matches
syn region	cwsCommentBlock		start="/\*" end="\*/" 
syn match   cwsNumber			"\d\[.[\d]+]?"
syn match	cwsComment			+L\=//.*+

" define a block of script
syn region	cwsBlock		start="{" end="}" contains=@cwsScript,cwsFuntionWord,cwsBlock
" define a script line
syn region	cwsScriptLine		start="=>" end=";" contains=@cwsScript,cwsFuntionWord oneline
" define a script block
syn region	cwsScriptBlock		start=/=>\s*[\_$]*{/ms=e+1 end="}"me=s-1 contains=@cwsScript,cwsBlock

"Define the default highlighting
hi def link	cwsType				Type 
hi def link	cwsDeclaration		Type
hi def link	cwsFunctionDecl		Function
hi def link	cwsFuntionWord		Function
hi def link	cwsString			String
hi def link	cwsEvalexpr			Number
hi def link	cwsInsertVar		String
hi def link	cwsInsert			Delimiter
hi def link	cwsConditional		cwsRepeat
hi def link	cwsRepeat			Operator
hi def link	cwsCommentBlock		Comment
hi def link	cwsComment			Comment
hi def link	cwsCharacter		Character
hi def link cwsEscSequence		SpecialChar
hi def link	cwsFunc				Keyword
hi def link cwsBoolean			Boolean
hi def link	cwsDec				Number
hi def link cwsFloat			Number
hi def link cwsTreeManagement	Function
hi def link cwsMisc				Keyword 
hi def link	cwsTreeAccess		Operator
