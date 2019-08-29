so ~/.vim/plugins.vim


" =================== Settings ========================

set encoding=UTF-8              " Need for glyphs
set noshowmode                  " We show the mode with airline or lightline


" =================== vim-airline ========================

let g:airline_theme='solarized'


"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
