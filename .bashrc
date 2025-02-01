# running non-interactively
if [[ $- != *i* ]]; then
   return
fi

# history
shopt -s histappend

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%F %T "

# prompt
PROMPT_COMMAND='
   history -a
   history -c
   history -r
   IFS="[;" read -p $'"'\e[6n'"' -d R -rs _ col row _
   PS0="\n"
   PS1="$([[ $row -ne 1 || $col -ne 1 ]] && echo "\n")\[\e[30;$([[ $EUID == 0 ]] && echo "101" || echo "107")m\]$PWD\[\e[m\] "
   PS2="${PWD//?/ } "
'

# the rest does not apply to root
if [[ $EUID != 0 ]]; then

   # environment variables
   source "$HOME/.profile"

   # aliases
   alias sudo='sudo --askpass'
   alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

   # start window manager
   if [[ -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
      exec niri-session &> /dev/null
   fi
fi
