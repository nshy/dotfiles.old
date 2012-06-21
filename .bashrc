# Check for an interactive session
#[ -z "$PS1" ] && return
[[ "$-" != *i* ]] && return

export MINGW_PATH='/usr/i686-pc-mingw32/sys-root/mingw'

if [[ $MINGW ]]; then
  export CC='i686-pc-mingw32-gcc'
  export PATH=.:${MINGW_PATH}/bin:$PATH
  export PS1='\e[32mMINGW\e[m \W $ '
  alias configure="configure --prefix=$MINGW_PATH"
else
  PATH=$PATH:/usr/lib
  export PS1='\W $ '
fi

PATH=$PATH:~/bin

#PS1=$'\e[01;35m\\W$\e[m'
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
export GREP_OPTIONS='-siE --color=always'

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

# . /bin/ssh-agent-helper
