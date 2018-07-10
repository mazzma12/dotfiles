" Source existing vimrc file
" https://vi.stackexchange.com/a/15548\
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
call plug#begin('$HOME/.vim/plugged')
" Or vim packages will not be found
source ~/.vimrc

" nvim plugins
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
call plug#end()

" Might solve weird esccape char ; also set TERM=screen-256colors
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

" Deoplete -----------------------------

" Use deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0
