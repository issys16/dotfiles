export PATH=$HOME/bin:/usr/local/bin:$PATH
plugins=(git)

##########################
# Appearance
##########################
function check-shell-command {
  if [ $? -eq 0 ]; then
    face="\e[32m(*'-')"
  else
    face="\e[34m(*;-;)"
  fi

  echo -e "${face}\e[m"
}

PS1='$(check-shell-command)\[\e[33m\]$(if git status &>/dev/null;then echo " "\($(git branch | grep -F "*" |cut -d" " -f2-)$(if [ $(git status -s | wc -l) -ge 1 ];then echo "*";else echo "";fi)\);fi)\[\e[0m\] \$ '

##########################
# thefuck
##########################
eval $(thefuck --alias)

##########################
# neovim
##########################
export XDG_CONFIG_HOME=$HOME/dotfiles

##########################
# alias
##########################
alias weather="curl wttr.in/Tokyo"
alias ll="ls -l"
alias grep="grep --color"
alias glog="git log --graph --decorate --oneline"
alias vim="nvim"
