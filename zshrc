# load oh-my-zsh and theme

ZSH=$HOME/.newdotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.newdotfiles/themes
plugins=(git)
ZSH_THEME="mluck"

source $ZSH/oh-my-zsh.sh

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
# load custom stuff
if [ -e ~/.zshrc.user ]
then
    source ~/.zshrc.user
fi
