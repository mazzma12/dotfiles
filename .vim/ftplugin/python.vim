" Space and tabs: https: // dougblack.io/words/a-good-vimrc.html
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " tabs are spaces
set foldmethod=indent " https: // stackoverflow.com/questions/357785/what-is-the-recommended-way-to-use-vim-folding-for-python-code
" set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

" Keep 10 lines above and below cursor to keep it centered vertically
set scrolloff=10

" Jedi configuration
let g:jedi#popup_on_dot=0 " Do not jedi autocomplete when a dot is typed 
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim/bin/python'
let g:virtualenv_auto_activate=1
let g:loaded_python_provider=1
let g:jedi#goto_command="<leader>d"
let g:jedi#goto_assignments_command="<leader>g"
let g:jedi#goto_definitions_command=""
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>n"
let g:jedi#completions_command="<C-Space>"
let g:jedi#rename_command="<leader>r"


if has("nvim")
	" From https://raw.githubusercontent.com/fisadev/fisa-nvim-config/master/init.vim
	" Deoplete -----------------------------

	" Use deoplete.
	let g:deoplete#enable_at_startup=1
	let g:deoplete#enable_ignore_case=1
	let g:deoplete#enable_smart_case=1
	" complete with words from any opened file
	let g:context_filetype#same_filetypes={}
	let g:context_filetype#same_filetypes._='_'
	let g:deoplete#sources#jedi#show_docstring=1

	" Jedi-vim ------------------------------

	" Disable autocompletion (using deoplete instead)
	let g:jedi#completions_enabled=0

	" Airline -----------------------------
	let g:airline#extensions#ale#enabled=1

	" ALE - -----------------------------
	let g:ale_echo_msg_format='(%linter%) [%code%] %s'
	let g:ale_linters={'python': ['flake8']}
	let g:ale_fixers=['autopep8', 'yapf']
	let g:ale_fix_on_save=1
	let g:ale_virtualenv_dir_names=[$PYENV_ROOT."/versions/neovim"]
endif
