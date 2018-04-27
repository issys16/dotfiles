" プラグインのセットアップ
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('scrooloose/nerdtree')

call dein#end()
call dein#save_state()

" 自動インストール
if dein#check_install()
  call dein#install()
endif

" color scheme
set background=dark
colorscheme PaperColor

" required
filetype plugin indent on
syntax enable

