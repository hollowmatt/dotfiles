#==========================================================================
# Source bashrc and aliases if present
#==========================================================================

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

#==========================================================================
# Basic settings
#==========================================================================

# set default editor
export EDITOR=vim

# Make `ls` use colors
export CLICOLOR=1

#==========================================================================
# History
#==========================================================================

export HISTSIZE=10000 # increase the size
shopt -s histappend # append session commands to .bash_history

#==========================================================================
# Prompt
#==========================================================================

# Outputs the current branch name in parentheses, e.g., (master)
# If the current directory is not managed by git, there is no output.
function current_branch_name {
  [[ $(git status 2> /dev/null) ]] && \
    echo " ($(git branch 2> /dev/null | sed -n '/\* /s///p'))"
}

# Outputs an asterix if the working directory is dirty.
# Otherwise, there is no output.
function dirty_state {
  [[ $(git status --porcelain 2> /dev/null) ]] && \
    echo "*"
}

ORANGE='\[\033[0;33m\]'
RED='\[\e[1;31m\]'
NO_COLOR='\[\e[0m\]'
USERNAME='\u'
HOSTNAME='\h'
CURRENT_WORKING_DIR='\W'
GIT_BRANCH_NAME='$(current_branch_name)'
DIRTY_STATE='$(dirty_state)'

# assign new colorized prompt
export PS1="$ORANGE[$CURRENT_WORKING_DIR$GIT_BRANCH_NAME$RED$DIRTY_STATE$ORANGE]\$$NO_COLOR "
