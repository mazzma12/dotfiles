" Buggy escape character in terminal emulator
" https://github.com/neovim/neovim/issues/6041
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor="$NVIM_TUI_ENABLE_CURSOR_SHAPE"

" https://vi.stackexchange.com/a/15548
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
Plug 'w0rp/ale'
call plug#end()

