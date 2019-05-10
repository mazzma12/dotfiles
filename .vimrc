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
Plug 'christoomey/vim-sort-motion'
call plug#end()

" Abbreviations
abbr flaot float
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " when indenting with '>', use 4 spaces width
set smarttab
set backspace=indent,eol,start
" colorscheme solarized
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
silent! colorscheme flattened_dark

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
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Motion

" From https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" move vertically by visual line https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim/21000307#21000307
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" highlight last inserted text
nnoremap gV `[v`]
"
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" In command mode (i.e. after pressing ':'), expand %% to the path of the current
" buffer. This allows you to easily open files from the same directory as the
" currently opened file.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <C-e> <C-o>$

" jk is escape
inoremap jk <esc>

" Map ; to : to avoid pressing shift to enter command mode
map ; :
let mapleader=","
map ,t :tabnew <CR>

" Airline configuration
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" Sensible vim
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
