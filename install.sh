setup_mac() {
    if [ "$(uname)" == 'Darwin' ]; then
        ## Mac
        echo "Setup for Mac"
        install_homebrew
        install_apps
        install_cask_apps
    fi
}

setup_debian() {
    if   [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
            # Ubuntu
            echo "Setup for Ubuntu"
            install_linuxbrew
            install_apps
        else
            # Debian
            echo "Setup for Debian"
            install_linuxbrew
            install_apps
        fi
    fi
}

setup_redhat() {
    if [ -e /etc/fedora-release ]; then
        # Fedra
        echo "Setup for Fedora"
        install_linuxbrew
        install_apps
    elif [ -e /etc/redhat-release ]; then
        if [ -e /etc/oracle-release ]; then
            # Oracle Linux
            echo "Setup for Oracle Linux"
            install_linuxbrew
            install_apps
        else
            # Red Hat Enterprise Linux
            echo "Setup for Red Hat Enterprise Linux"
            install_linuxbrew
            install_apps
        fi
    fi
}

setup_arch() {
    if [ -e /etc/arch-release ]; then
        # Arch Linux
        echo "Setup for Arch Linux"
        install_linuxbrew
        install_apps
    fi
}

setup_suse() {
    if [ -e /etc/SuSE-release ]; then
        # OpenSUSE
        echo "Setup for OpenSUSE"
        install_linuxbrew
        install_apps
    fi
}

setup_mandriva() {
    if [ -e /etc/mandriva-release ]; then
        # Mandriva Linux
        echo "Setup for Mandriva Linux"
        install_linuxbrew
        install_apps
    fi
}

setup_gentoo() {
    if [ -e /etc/gentoo-release ]; then
        # Gentoo Linux
        echo "Setup for Gentoo Linux"
        install_linuxbrew
        install_apps
    fi
}

install_homebrew() {
    echo "installing homebrew..."
    which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_linuxbrew() {
    echo "installing linuxbrew..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
    test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
    test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
    echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
}

install_apps() {
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
    neovim
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

    pip3 install --upgrade neovim

    brew cleanup
}

install_cask_apps() {
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

    brew cask cleanup
}

setup() {
    setup_mac
    setup_debian
    setup_redhat
    setup_arch
    setup_arch
    setup_suse
    setup_mandriva
    setup_gentoo
}

setup

cat << END

**************************************************
SETUP COMPLETED! bye.
**************************************************

END
