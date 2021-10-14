# zshhrc
source $HOME/.alias
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.pathrc

## from bashrc
# enable color support of ls and also add handy aliases
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

export EDITOR="nvim"
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
disable r
bindkey -e

HOSTNAME=$(hostname)
if [[ "$HOSTNAME" == *"villa-bosch.de" ]]; then
  CONDA_PREFIX="/hits/fast/mbm/buhrjk/software/conda"
else
  CONDA_PREFIX="$HOME/miniconda3"
fi

eval "$($CONDA_PREFIX/bin/conda shell.zsh hook)"

eval "$(starship init zsh)"

