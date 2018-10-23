" Use vim rathe than vi

set nocompatible

" Tabs etc
set nowrap
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Show line numbers
set number relativenumber

" Word wrapping
set wrap

" Incremental seraching
set incsearch

" Stuff needed for vimwiki plugin
filetype plugin on
syntax on
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Split settings
set splitbelow
set splitright
