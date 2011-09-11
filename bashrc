#
# ~/.bashrc
#

if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]; then
	INPUTRC=/etc/inputrc
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
	. ~/code/libs/django/django/extras/django_bash_completion
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Colorized ls
alias ls='ls --color=auto'
eval `dircolors -b`

# Colorized grep
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# Keep the color in less
alias less='less -R'

# Colorized man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# [user] [dir] $
PS1=' \[\033[01;34m\][\[\033[01;33m\]\W\[\033[01;34m\]] \[\033[01;33m\]$\[\033[00m\] '

test -n "$DISPLAY" && export TERM=xterm-color
export TERM=rxvt-unicode

export OOO_FORCE_DESKTOP=gnome
export EDITOR=/usr/bin/vim
export TMPDIR=/tmp
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TEXINPUTS=".:~/Boulot/cv/sources/:"
export PAGER=~/code/libs/mysqlpager/mypager.pl

has_virtualenv() {
	if [ -e .venv ]; then
		workon `cat .venv`
	fi
}

venv_cd() {
	cd "$@" && has_virtualenv
}
alias cd="venv_cd"

export PATH=$PATH:~/.bin
export LD_LIBRARY_PATH=/usr/lib
export PYTHONSTARTUP=~/.pythonrc

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
