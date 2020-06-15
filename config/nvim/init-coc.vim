""" CoC stuff:

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" BEGIN coc-explorer stuff

" Toggle explorer
nmap <space>e :CocCommand explorer<CR>

" Allow for floating explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
nmap <space>f :CocCommand explorer --preset floating<CR>

" If only buffer is coc-explorer then exit vim
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

