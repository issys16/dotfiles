" ########################
" SETUP dein.vim
" ########################
let s:dein_dir = $HOME . '/.vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('scrooloose/nerdtree')
call dein#add('Yggdroot/indentLine')
call dein#add('itchyny/lightline.vim')
call dein#add('Shougo/deoplete.nvim')

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

" ########################
" ColorScheme
" ########################
set background=dark
colorscheme PaperColor

" ########################
" Customize 
" ########################
filetype plugin indent on
syntax enable
set nu
set backspace=indent,eol,start
set laststatus=2
set showmode
set showcmd
set ruler
let g:deoplete#enable_at_startup = 1
