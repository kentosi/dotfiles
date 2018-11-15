scriptencoding utf-8

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

" Settings for vimwiki
set nocompatible
filetype plugin on
syntax on

colorscheme solarized
set background=dark
highlight Normal ctermbg=none
highlight NonText ctermbg=none

"set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h10
set guifont=Liberation\ Mono\ Powerline
set t_Co=256

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1


let g:airline_theme='papercolor'


