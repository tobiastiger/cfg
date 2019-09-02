"" This just sources .vimrc in .nvim/

set runtimepath^=/.vim runtimepath+=~/.vim/after

let &packpath = &runtimepath

source ~/.nvim/.vimrc
