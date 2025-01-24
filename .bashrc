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
   PS1="\e[30;$([[ $EUID == 0 ]] && echo "101" || echo "107")m$([[ $row -ne 1 || $col -ne 1 ]] && echo "\n")$PWD\e[m\e[K "
   PS2="$(echo "$PWD" | sed -e '"'s/./ /g') "'"
'

# the rest does not apply to root
if [[ $EUID != 0 ]]; then

   # environment variables
   source "$HOME/.profile"

   # aliases
   alias sudo='sudo --askpass'
   alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

   # ssh agent
   if ! pgrep -u "$USER" ssh-agent > /dev/null; then
      ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
   fi
   if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
      source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
   fi

   # start window manager
   if [[ -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
      exec niri-session &> /dev/null
   fi
fi
