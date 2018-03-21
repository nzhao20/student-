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
    \ set tabstop=4 |
    \ set softtabstop=4 |   
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
"OCaml indentation
"au BufEnter *.ml setf ocaml
"au BufEnter *.mli setf ocaml
"au FileType ocaml call FT_ocaml()
"function FT_ocaml()
"    set textwidth=80
"    set colorcolumn=80
"    set shiftwidth=2
"    set tabstop=2
"endfunction
"set rtp^="/Users/nicholaszhao/.opam/4.04.0/share/ocp-indent/vim"
"status bar
set laststatus=2 "always displays the status bar
set noshowmode

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'ervandew/supertab'
call plug#end() 

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 76e511fdcc75861babe189153d21126d ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/nicholaszhao/.opam/4.04.0/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
