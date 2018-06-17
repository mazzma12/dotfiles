" Run PATHOGEN modules
execute pathogen#infect()

" Add background theme
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Space and tabs : https://dougblack.io/words/a-good-vimrc.html
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " tabs are spaces
filetype plugin indent on

" Keep 10 lines above and below cursor to keep it centered vertically
set scrolloff=10

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
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

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
