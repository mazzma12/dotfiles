" https://vi.stackexchange.com/a/15548
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
Plug 'w0rp/ale'
call plug#end()
