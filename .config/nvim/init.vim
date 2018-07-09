" https://vi.stackexchange.com/a/15548
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
call plug#end()

" Might solve weird esccape char ; also set TERM=screen-256colors
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

let g:python3_host_prog = '/home/matthieu/Envs/neovim/bin/python'
let g:virtualenv_auto_activate = 1
