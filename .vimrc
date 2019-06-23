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
"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q

" ########################
" vim-indent-guides
" ########################
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" ########################
" syntastic
" ########################
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ########################
" gitgutter
" ########################
let g:gitgutter_highlight_lines = 0 "1にするとデフォルトでハイライト表示する
set updatetime=10

" ########################
" deoplate
" ########################
let g:deoplete#enable_at_startup = 1

" ########################
" ColorScheme
" ########################
set background=dark
colorscheme iceberg

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

" ########################
" quickrun 
" ########################
let g:quickrun_config={'*': {'split': ''}}

" ########################
" kana/vim-submode 
" ########################
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

" ########################
" Customize 
" ########################
filetype plugin indent on
syntax enable
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set number
set backspace=indent,eol,start
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
set incsearch
set ignorecase
set smartcase
set hlsearch
set list
set listchars=eol:¬,tab:▸\ 
set whichwrap=b,s,h,l,<,>,[,],~
set cursorline
set showtabline=3
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
