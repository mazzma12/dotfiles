" Source existing vimrc file
" https://vi.stackexchange.com/a/15548\
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
call plug#begin('$HOME/.vim/plugged')
" Or vim packages will not be found
source ~/.vimrc

" nvim plugins
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Might solve weird esccape char ; also set TERM=screen-256colors
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <C-A-L> :ALEFix <CR>

" Add ale default fixer
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers.python = ['black']


