export PATH=$HOME/bin:/usr/local/bin:$PATH

##########################
# alias
##########################
plugins=(git)
alias weather="curl wttr.in/Tokyo"

##########################
# thefuck
##########################
eval $(thefuck --alias)

##########################
# neovim
##########################
export XDG_CONFIG_HOME=$HOME/dotfiles
alias vi="nvim"
alias vim="nvim"

##########################
# custom
##########################
alias ll="ls -l"
