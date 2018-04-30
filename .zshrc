export PATH=$HOME/bin:/usr/local/bin:$PATH

##########################
# oh-my-zsh
##########################
export ZSH=~/dotfiles/oh-my-zsh
ZSH_THEME="kphoen"

##########################
# zsh
##########################
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history
setopt hist_ignore_dups

##########################
# alias
##########################
plugins=(git)
alias weather="curl wttr.in/Tokyo"

##########################
# rbenv
##########################
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
# custom function
##########################
function ph() {
  local prompt_descriptions
  prompt_descriptions=(
    $ZSH_THEME_GIT_PROMPT_DIRTY 'dirty\tclean でない'
    $ZSH_THEME_GIT_PROMPT_UNTRACKED 'untracked\tトラックされていないファイルがある'
    $ZSH_THEME_GIT_PROMPT_CLEAN 'clean'
    $ZSH_THEME_GIT_PROMPT_ADDED 'added\t追加されたファイルがある'
    $ZSH_THEME_GIT_PROMPT_MODIFIED 'modified\t変更されたファイルがある'
    $ZSH_THEME_GIT_PROMPT_DELETED 'deleted\t削除されたファイルがある'
    $ZSH_THEME_GIT_PROMPT_RENAMED 'renamed\tファイル名が変更されたファイルがある'
    $ZSH_THEME_GIT_PROMPT_UNMERGED 'unmerged\tマージされていないファイルがある'
    $ZSH_THEME_GIT_PROMPT_AHEAD 'ahead\tmaster リポジトリよりコミットが進んでいる'
  )

  local i
  for ((i = 1; i <= $#prompt_descriptions; i += 2))
  do
    local p=$prompt_descriptions[$i]
    local d=$prompt_descriptions[$i+1]
    echo `echo $p | sed -E 's/%.| //g'` $reset_color $d
  done
}

source $ZSH/oh-my-zsh.sh
