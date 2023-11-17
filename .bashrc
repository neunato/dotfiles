# running non-interactively
if [[ $- != *i* ]]; then
   return
fi

# ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
   ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
   source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# expand path
PATH="${PATH}:~/scripts"

# bash prompt
PROMPT_COMMAND='
   command="$(history | tail -n 1 | cut -d \  -f 5)"
   PS1="$([[ $command != "clear" && $PS2 != "> " ]] && echo "\n")[\u@\H \w]\$ "
   PS2="$(echo "[$(whoami)@$HOSTNAME ${PWD/#$HOME/\~}]\$ " | sed "s/./ /g")"
   unset command
'
alias bash='echo && bash'

# start x
if [[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
   exec startx
fi
