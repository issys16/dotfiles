git submodule init
git submodule update

# set up oh-my-zsh
~/dotfiles/oh-my-zsh/tools/install.sh

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ~/dotfiles/"$f" ~/
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
