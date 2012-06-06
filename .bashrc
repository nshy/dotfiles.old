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
shopt -s dotglob globstar failglob
shopt -u extglob nullglob

# don't mind small misspellings
shopt -s cdspell
# append to history file instead of overwriting it
shopt -s histappend

# grep options
# -i ignores case
# -s supress errors and warnings about filetypes
# -E gives ERE syntax
export GREP_OPTIONS='-siE --color'

# ls options
# -# shows up filetypes in names (/@* etc)
alias ls='ls -F'

# less options
# -i ignores cas
export LESS='-i'

# man options
# TODO need a better solution
#alias mang="MANPATH=${MINGW}/share/man man"

# no programmable completion for now
complete -r

# . /bin/ssh-agent-helper
