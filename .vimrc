" tagbar, snipmate, comments, cscope, nerdtree

""" Pathogen
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible      " use vim defaults
set encoding=utf-8    " use utf-8
set ls=2              " always show status line
set scrolloff=4       " keep 4 lines when scrolling
set showcmd           " display incomplete commands
set hlsearch          " highlight searches
set incsearch         " do incremental searching
set ruler             " show the cursor position
set visualbell t_vb=  " turn off error beep/flash
set novisualbell      " turn off visual bell
set number            " show line numbers
set ignorecase        " ignore case when searching
set smartcase         " no ignorecase if Uppercase char present
set smarttab          " tab and backspace are smart
set title             " show title (console)
set titleold=         " reset the title at exit
set titlestring=Vim:\ %F
set t_Co=256          " set 256 colors
set ttyfast           " smoother change
set modeline          " last line in document sets vim mode
set modelines=5       " number of lines checked for modelines
set shortmess=atI     " abbreviate messages
set nohidden          " when tab is closed, remove the buffer
set nostartofline     " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set mouse=a           " mouse support
set wildmenu          " completion menu
set showmatch         " Show matching brackets
set backspace=indent,eol,start  " make that backspace key work the way it should
set tabstop=4         " number of space of the tab character
set shiftwidth=4      " number of space of (auto)indent

"set autoindent        " always set autoindenting on
"set smartindent       " smart indentation
set noautoindent
set nosmartindent
set cindent           " C indentation

set expandtab         " tabs are converted to spaces
set sm                " show matching braces
set nowrap            " don't wrap lines

set wildignore=*.swp,*.bak,*.pyc

set list listchars=tab:→\ ,trail:.

" Enable / Disable the paste mode
nnoremap ,p :set invpaste paste?<CR>
set pastetoggle=,p
set showmode

" Fold settings
set foldmethod=syntax
set foldcolumn=3
set foldenable

" Fast window resizing
nmap <S-Down> :res +5<CR>
nmap <S-Up> :res -5<CR>
nmap <S-Left> <C-W>5<
nmap <S-Right> <C-W>5>

" Misc binding
nmap ,q :TagbarToggle<CR>
map <silent> <C-N> :silent noh<CR>  " turn off hightlighted search
map ,s :shell<CR>
nmap <Space> <PageDown>
cmap tb tabnew

" 80 colums
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"set textwidth=79
"set cc=+1

filetype on
filetype plugin on
filetype plugin indent on

syntax on                         " syntax highlighting
if has("gui_running")             " gvim
    set guifont=Monospace\ 10
    set lines=50                  " height, 50 lines
    set columns=100               " width, 100 lines
    set background=dark           " adapt colors for background
    set selectmode=mouse,key,cmd
    set keymodel =
else
    colorscheme ir_black          " color scheme
    set background=dark           " adapt colors for background
endif

if has("vms")
	set nobackup                  " do not keep a backup file, use versionning instead
else
	set backup                    " keep a backup file
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Activate indentation
    au FileType python    set autoindent
    au FileType go        set noexpandtab

    " Set tab settings
    au FileType c setl sw=8 ts=8 sts=4
    au FileType cpp setl sw=4 ts=4 sts=2
endif

""" NERDTree
nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
                                  " and a double click to open files

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Tagbar gotags integration
map <F3> :!gotags *.go > tags<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
