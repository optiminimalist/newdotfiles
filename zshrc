# load oh-my-zsh and theme

ZSH=$HOME/.newdotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.newdotfiles/themes
plugins=(git)
ZSH_THEME="mluck"

source $ZSH/oh-my-zsh.sh

# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
# export GREP_COLOR='1;33'
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
# load custom stuff
if [ -e ~/.zshrc.user ]
then
    source ~/.zshrc.user
fi
