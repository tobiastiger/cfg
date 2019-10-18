call plug#begin('~/.local/share/nvim/plugged')

Plug 'easymotion/vim-easymotion'  " Quick navigation
Plug 'tpope/vim-surround'         " Easy change of parantheses and quotations
Plug 'tpope/vim-commentary'       " Quickly add comment
Plug 'tpope/vim-projectionist'    " Create project templates
Plug 'tpope/vim-dispatch'         " Build tool
Plug 'tpope/vim-endwise'          " End structures automatically, e.g. add 'end' to 'if'
Plug 'neomake/neomake'            " Asynchronously run programs
Plug 'liuchengxu/vista.vim'       " View and search LSP symbols
Plug 'junegunn/goyo.vim'          " Distraction-free writing

Plug 'yuttie/comfortable-motion.vim'      " Smooth scrolling
Plug 'w0rp/ale'                           " Lint engine
Plug 'jiangmiao/auto-pairs'               " Insert or delete brackets in pairs
Plug 'ctrlpvim/ctrlp.vim'                 " Path fuzzy finder
Plug 'rhysd/git-messenger.vim'            " Reveals the hidden message from Git under the cursor
Plug 'niklaas/lightline-gitdiff'          " Diff in lightline
Plug 'tpope/vim-fugitive'                 " Git wrapper
Plug 'itchyny/lightline.vim'              " Lightweight statusline
Plug 'scrooloose/nerdtree'                " File system explorer
Plug 'christoomey/vim-tmux-navigator'     " Plugin for using tmux with vim
Plug 'vimwiki/vimwiki'                    " Personal wiki
Plug 'janko/vim-test'                     " Vim test runner
Plug 'ervandew/supertab'                  " Tab completion

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Nerdtree syntax highlightning

Plug 'sainnhe/lightline_foobar.vim'       " Lightline colorschemes
Plug 'shime/vim-livedown'                 " Live markdown previews
Plug 'machakann/vim-highlightedyank'      " Highlight coloring
Plug 'ryanoasis/vim-devicons'             " Filetype icons

" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim', { 'as': 'nord' }
Plug 'haishanh/night-owl.vim'
Plug 'dracula/vim', { 'as': 'dracula'}
Plug 'kaicataldo/material.vim'

call plug#end()
