#!/bin/bash

# Check for an interactive session
[[ "$-" != *i* ]] && return

export PS1='[\u@\h \W]\$ '

export EDITOR="vim"
export LC_CTYPE="ru_RU.utf8"
export LC_TIME="ru_RU.utf8"
export LC_COLLATE="ru_RU.utf8"
export CTAGS="--c-kinds=+px"

# Set glob options
# globstar enables **
# dotglob * captures dotfies
# failglob stops execution if there no matches
shopt -s dotglob globstar failglob
# nullglob removes pattern if there no matches
# extglob enables extended patterns
shopt -u extglob nullglob

# don't mind small misspellings
shopt -s cdspell
# append to history file instead of overwriting it
shopt -s histappend

# grep options
# -i ignores case
# -s supress errors and warnings about filetypes
# -E gives ERE syntax
alias grep='grep -siE --color=always'

# ls options
# -# shows up filetypes in names (/@* etc)
alias ls='ls -F1'
alias lsd='ls -F1 --group-directories-first'

# less options
# -i ignores case
# -FX simply print one page files
# -R enables colors
# -S chop long lines
# FRSX comes from man git-config
export LESS='-iFRSX'

# no programmable completion for now
# complete -r

# history options
HISTCONTROL=ignoreboth:ignorespace
HISTFILESIZE=10000
HISTSIZE=10000
HISTIGNORE='ls::fg:history:'

# navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
