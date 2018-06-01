# dotfiles

- Mac/CentOS/Fedora/RedHat/etc...
```
$ git clone git@github.com:issy-s16/dotfiles.git ~/dotfiles --recursive
$ source install.sh
$ source link.sh
$ cat ~/.bashrc | sed 1i"export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' > ~/.bashrc
$ cat ~/.zshrc | sed 1i"export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' > ~/.zshrc
```
