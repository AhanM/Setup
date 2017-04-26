# Virtualenv/VirtualenvWrapper
source /usr/local/bin/virtualenvwrapper.sh

# To solve the UTF-8 ValueError
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Matplotlib Virtualenv work around
function frameworkpython {
  if [[ ! -z "$VIRTUAL_ENV" ]]; then
    PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
  else
    /usr/local/bin/python "$@"
  fi
}
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

[[ -s ~/.bashrc ]] && source ~/.bashrc

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFah'
alias ll='ls -l'
alias ddu='sh ~/Dropbox/Development/Themes\
  WordPress/dobsondev-underscores/ddunderscores-osx.sh'
alias 'rm'='rm -i'
alias 'rm'='rm -rf -i'

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#git config --global color.ui auto

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="$REDBOLD\u$CYAN@$GREENBOLD\w$PURPLEBOLD"'$(__git_ps1 "(%s)")'" $CYANBOLD>> $RESETCOLOR"
  export PS2="$PURPLE | ➝ $RESETCOLOR"
}

prompt

# Setting PATH for Python 3.4
# The orginal version is saved in
# .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda2 4.3.0 installer
export PATH="/Users/Ahan/anaconda2/bin:$PATH"
