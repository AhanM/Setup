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

# Linux coloring
export TERM="xterm-color" 
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
export LSCOLORS=GxFxCxDxBxegedabagaced

eval `gdircolors ~/.dir_colors`
alias ls="gls --color=auto"
alias ll="gls --color=auto -lh"
alias la="gls --color=auto -a"
