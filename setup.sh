git submodule init
git submodule update

# set up oh-my-zsh
~/dotfiles/oh-my-zsh/tools/install.sh

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ~/dotfiles/"$f" ~/
done

# neovim
ln -snfv ~/dotfiles/nvim/ ~/.vim 
ln -snfv ~/dotfiles/nvim/init.vim ~/.vimrc 

# dein.vim
ln -snfv ~/dotfiles/dein/dein.toml ~/.dein.toml
ln -snfv ~/dotfiles/dein/dein_lazy.toml ~/.dein_lazy.toml

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
