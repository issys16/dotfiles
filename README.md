# dotfiles

- Mac
```bash
$ git clone git@github.com:issy-s16/dotfiles.git ~/dotfiles --recursive
$ sh install.sh
$ sh link.sh
```
- CentOS/Fedora/RedHat
```bash
$ git clone git@github.com:issy-s16/dotfiles.git ~/dotfiles --recursive
$ sh install.sh
$ sh link.sh

$ test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
$ test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
$ test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
$ echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
```
