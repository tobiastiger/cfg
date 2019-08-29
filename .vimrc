so ~/.vim/plugins.vim


" Settings

set encoding=UTF-8              " Need for glyphs
set noshowmode                  " We show the mode with airline or lightline
set guifont=Hack\ Nerd\ Font\ 11

syntax enable

if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" let g:hybrid_use_Xresources = 1
" let g:rehash256 = 1
colorscheme solarized
set guifont=Inconsolata:h15
set guioptions-=L

" =================== vim-DevIcons ========================

let g:airline_powerline_fonts = 1


" =================== vim-airline ========================

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
