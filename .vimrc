"colors
colorscheme molokai "cool colorscheme 
syntax enable "enable syntax processing

"spacing
set tabstop=4 "number of visual space per tab
set softtabstop=4 "number of space in tab when editing
set expandtab "tabs are spaces
set shiftwidth=4 "indents are 4 spaces

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the space bar
nnoremap <space> za
"searching
set incsearch
set hlsearch

"ui configurations
set number "shows line numbers
set showcmd "shows command in bottom bar
set cursorline "highlight current line
filetype indent on "load filetype-specific indent files
set wildmenu
set lazyredraw
set showmatch
set encoding=utf-8 "support for utf8 encoding for characters
"python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"status bar
set laststatus=2 "always displays the status bar
set noshowmode

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
call plug#end() 

