let mapleader=" "         
let maplocalleader="-"    " 'leader' for certain file types

nnoremap ; :
nnoremap : ;

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Quickly call external programs
nnoremap <leader>> :!<CR>

" Copy/paste from register
vnoremap <leader>cc "*y
map <leader>vv "*p

