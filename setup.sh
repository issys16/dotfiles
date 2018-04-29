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
ln -snfv ~/.dein.toml ~/dotfiles/dein/dein.toml
ln -snfv ~/.dein_lazy.toml ~/dotfiles/dein/dein_lazy.toml

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
