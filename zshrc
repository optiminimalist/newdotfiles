#
## Executes commands at the start of an interactive session.
##
## Authors:
##   Sorin Ionescu <sorin.ionescu@gmail.com>
##
#
## Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

  # Customize to your needs...


# Show human friendly numbers and colors
if [[ $OSTYPE == darwin* ]]; then
    alias ls='ls -Gh'
else
    alias ls='ls -Gh --color'
fi

# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
# export GREP_COLOR='1;33'
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

alias cs='ssh -l ml483 ml483.host.cs.st-andrews.ac.uk'
alias sumac='ssh -l mentorin www.mentoringscotland.org.uk'
alias gf='git flow'

# Customize to your needs...
# export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/.cabal/bin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code

source /usr/local/bin/virtualenvwrapper.sh

export LANG="en_US.UTF-8"

### Added by the Heroku Toolbelt
export PATH="/opt/yagarto-4.7.2/bin:/usr/local/heroku/bin:$PATH"
function gitignore() { curl http://gitignore.io/api/$@ ;}

