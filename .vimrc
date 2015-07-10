set nocompatible      " use vim defaults

" Enable Vundle

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" End Vundle part


set ls=2              " always show status line
set tabstop=4         " number of space of the tab character
set shiftwidth=4      " number of space of (auto)indent
set scrolloff=4       " keep 4 lines when scrolling
set showcmd           " display incomplete commands
set hlsearch          " highlight searches
set incsearch         " do incremental searching
set ruler             " show the cursor position
set visualbell t_vb=  " turn off error beep/flash
set novisualbell      " turn off visual bell
set number            " show line numbers
set ignorecase        " ignore case when searching
set smartcase         " Don't ignore case when a pattern has a capital letter
set title             " show title (console)
set titleold=         " reset the title at exit
set titlestring=VIM:\ %F
set t_Co=256          " set 256 colors
set ttyfast           " smoother change
set modeline          " last line in document sets vim mode
set modelines=5       " number of lines checked for modelines
set shortmess=atI     " abbreviate messages
set nostartofline     " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set mouse=a           " mouse support

"set autoindent        " always set autoindenting on
"set smartindent       " smart indentation
"set cindent           " C indentation
set noautoindent
set nosmartindent
set nocindent

set expandtab        " tabs are converted to spaces
set sm                " show matching braces
set nowrap            " don't wrap lines

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

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]> " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T> " Backspace to go back

    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72

    " Activate indentation
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent

    " File formats
    au BufNewFile,BufRead *.pls set syntax=dosini
    au BufNewFile,BufRead modprobe.conf set syntax=modconf
endif

map <F1> :previous<CR>              " map F1 to open previous buffer
map <F2> :next<CR>                  " map F2 to open next buffer
map <F3> :%s/\s\+$//e<CR>           " remove trailing whitespaces
map <silent> <C-N> :silent noh<CR>  " turn off hightlighted search
map ,v :sp ~/.vimrc<CR>             " edit my .vimrc file in a split
map ,e :e ~/.vimrc<CR>              " edit my .vimrc file
map ,u :source ~/.vimrc<CR>         " update the system settings from the vimrc
map ,s :shell<CR>
map ,q :TagbarToggle<CR>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Enable completion menu, with highlight
highlight PmenuSel ctermbg=green ctermfg=black
" Disable preview window when iterating on completion
set completeopt-=preview

" neocomplete config:
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><C-@> pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
let g:neocomplete#disable_auto_complete=1

" NERDTree
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" Disable go-def with :gd since I want it to be a word search
let g:go_def_mapping_enabled = 0

