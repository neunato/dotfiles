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
   function _bash_prompt_command {
      local prompt_marker="\e]133;A\e\\\\"
      local cmd_start_marker="\e]133;C\e\\\\"
      local cmd_end_marker="\e]133;D\e\\\\"
      history -a
      history -c
      history -r
      IFS="[;" read -p $'"'\e[6n'"' -d R -rs _ col row _
      PS0="\n$cmd_start_marker"
      PS1="$([[ $row -ne 1 || $col -ne 1 ]] && echo "\n")\[$prompt_marker\]\[\e[30;$([[ $EUID == 0 ]] && echo "101" || echo "107")m\]$PWD\[\e[m\] "
      PS2="${PWD//?/ } "
      echo -en "$cmd_end_marker"
      unset -f _bash_prompt_command
   }
   _bash_prompt_command
'

# the rest does not apply to root
if [[ $EUID != 0 ]]; then
   # environment
   source "$HOME/.profile"

   # aliases
   if [[ -n "$WAYLAND_DISPLAY" ]]; then
      alias sudo='sudo --askpass'
   fi
   alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
fi
