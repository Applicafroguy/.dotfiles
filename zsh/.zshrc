
test -e ~/.env && source ~/.env
test -e ~/.alias && source ~/.alias
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
disable r
bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

if [ -d /etc/profile.d ]; then
  setopt no_nomatch
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  setopt nomatch
fi

eval "$($CONDA_PREFIX/bin/conda shell.zsh hook)"

eval "$(starship init zsh)"

