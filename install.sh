#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    git
    wget
    curl
    tree
    openssl
    z
    colordiff
    "--without-etcdir zsh"
    zsh-completions
    cask
    peco
    hub
    tig
    python3
    lua
    "vim --with-lua --with-python3"
    ricty
    markdown
    ssh-copy-id
    diff-so-fancy
    thefuck
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    echo "---------------------------"
    echo "installing ${formula}"
    echo "---------------------------"
    brew install $formula || brew upgrade $formula
    echo ""
done

echo "---------------------------"
echo "installing neovim"
echo "---------------------------"
pip3 install --upgrade neovim
echo ""

casks=(
    iterm2
    dropbox
    virtualbox
    vagrant
    vagrant-manager
    docker
    docker-toolbox
    gas-mask
    bettertouchtool
    alfred
    slack
    google-chrome
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    echo "---------------------------"
    echo "installing ${cask}"
    echo "---------------------------"
    brew cask install $cask
    echo ""
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
