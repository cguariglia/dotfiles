syntax on

set tabstop=4
set autoindent
set expandtab
"line numbers
set number
"enable mouse
set mouse=a

set encoding=utf-8

inoremap <S-Tab> <C-V><Tab>
let g:airline_powerline_fonts = 1
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'dylanaraps/wal.vim'

call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

