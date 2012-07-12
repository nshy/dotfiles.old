# Check for an interactive session
[[ "$-" != *i* ]] && return

export PS1='\W $ '
PATH=$PATH:~/bin:

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
alias ls='ls -F1 --group-directories-first'

# less options
# -i ignores case
# -FX simply print one page files
# -R enables colors
# -S chop long lines
# FRSX comes from man git-config
export LESS='-iFRSX'

# man options
# TODO need a better solution
#alias mang="MANPATH=${MINGW}/share/man man"

# no programmable completion for now
complete -r

# CYGWIN specific
[[ $(uname) =~ CYGWIN ]] && . .cygwin/bashrc
# Arch specific
[[ $(uname) =~ Linux ]] && PATH=$PATH:~/.gem/ruby/1.9.1/bin

# history options
HISTCONTROL=ignoreboth:ignorespace
HISTFILESIZE=10000
HISTSIZE=10000
