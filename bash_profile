#==========================================================================
# define colors
#==========================================================================
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[35m\]"
DARK_GRAY="\[\033[1;30m\]"
DEFAULT="\[\e[0m\]"

#==========================================================================
# aliases
#==========================================================================
alias ls="ls -A"
alias ll="ls -lh"
alias startgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stopgres="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias pbrew="pythonbrew"
alias irc="weechat-curses"

alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

#==========================================================================
# basic settings
#==========================================================================

# set default editor
export EDITOR=vim

# Make ls use colors
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# tell compiler to always assume 64 bits
export ARCHFLAGS="-arch x86_64"

#==========================================================================
# Homebrew
#==========================================================================

# rearrange path for homebrew
export PATH=/usr/local/bin:$PATH

# setup bash completion for homebrew
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

#==========================================================================
# Git
#==========================================================================

# setup git prompt function
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

# have git prompt note uncommitted changes
GIT_PS1_SHOWDIRTYSTATE=true

#==========================================================================
# RVM
#==========================================================================

# Add rvm to bash session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load rvm bash completion
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

#==========================================================================
# python brew
#==========================================================================

# load pythonbrew to bash session
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

#==========================================================================
# setup path for npm
#==========================================================================

export PATH=/usr/local/share/npm/bin:$PATH

#==========================================================================
# prompt
#==========================================================================
# Add the bit below for ruby version@gemset in prompt
# $YELLOW\$(~/.rvm/bin/rvm-prompt)

# assign new colorized prompt
# export PS1="$GREEN\w$(__git_ps1) $DARK_GRAY\$$DEFAULT "
export PS1='\[\033[0;32m\]\W\[\033[0;33m\]$(__git_ps1) \[\e[0m\]\$ '

# assign new colored root prompt
export SUDO_PS1="\[\e[33;1;41m\][\u] #\[\e[0m\] "
