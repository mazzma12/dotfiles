" Space and tabs : https://dougblack.io/words/a-good-vimrc.html
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " tabs are spaces
set foldmethod=indent " https://stackoverflow.com/questions/357785/what-is-the-recommended-way-to-use-vim-folding-for-python-code
" set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

" Keep 10 lines above and below cursor to keep it centered vertically
set scrolloff=10

