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
ln -snfv ~/.vim ~/dotfiles/nvim/ 
ln -snfv ~/.vimrc ~/dotfiles/nvim/init.vim

# dein.vim
ln -snfv ~/dotfiles/dein/dein.toml ~/.dein.toml
ln -snfv ~/dotfiles/dein/dein_lazy.toml ~/.dein_lazy.toml

# iterm2
ln -snfv ~/dotfiles/iterm2 ~/.iterm2

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
