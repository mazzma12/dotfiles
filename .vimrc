" https://github.com/junegunn/vim-plug
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'romainl/vim-cool'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'romainl/flattened' " For colorscheme
call plug#end()

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

filetype plugin indent on

" colorscheme solarized
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
colorscheme flattened_dark

" Line number column on the left
" Taken from https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
" Color the column number 121 differently
let &colorcolumn=121

" To jump back to where you last were when editing the file

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Motion
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" Map ; to : to avoid pressing shift to enter command mode
map ; :

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Jedi configuration
let g:jedi#popup_on_dot = 0 " Do not jedi autocomplete when a dot is typed 
let g:python3_host_prog = $WORKON_HOME.'/neovim/bin/python'
let g:virtualenv_auto_activate = 1
let g:loaded_python_provider = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
