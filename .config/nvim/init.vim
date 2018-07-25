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
let g:deoplete#enable_at_startup = 1
call plug#end()

" Might solve weird esccape char ; also set TERM=screen-256colors
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

" From https://raw.githubusercontent.com/fisadev/fisa-nvim-config/master/init.vim
" Deoplete -----------------------------

" Use deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'
let g:deoplete#sources#jedi#show_docstring = 1

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" Airline -----------------------------
let g:airline#extensions#ale#enabled = 1

" ALE ------------------------------
let g:ale_echo_msg_format = '(%linter%) [%code%] %s'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = ['autopep8', 'yapf']
let g:ale_fix_on_save = 1
let g:ale_virtualenv_dir_names=[$WORKON_HOME."/neovim"]
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <C-A-L> :ALEFix <CR>
