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

if dein#load_state(s:dein_dir)
  call dein#begin(expand('~/.vim/dein'))

  let s:toml      = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" ########################
" NERDTree
" ########################
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ########################
" gitgutter
" ########################
let g:gitgutter_highlight_lines = 1
set updatetime=10

" ########################
" deoplate
" ########################
let g:deoplete#enable_at_startup = 1

" ########################
" ColorScheme
" ########################
set background=dark
colorscheme PaperColor
let g:airline_theme = 'papercolor'

" ########################
" Customize 
" ########################
filetype plugin indent on
syntax enable
set nu
set backspace=indent,eol,start

" ########################
" vim-cheatsheet 
" ########################
let g:cheatsheet#cheat_file = '~/.cheetsheet.md'

" ########################
" markdown 
" ########################
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
