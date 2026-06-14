if not status is-interactive
   exit
end

set -g fish_handle_reflow 0
set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 0

set -gx EDITOR /usr/bin/zeditor

abbr -a c clear
abbr -a ls ls -lah --group-directories-first
abbr -a sudo sudo -s --askpass
abbr -a su su -s /usr/bin/fish

function fish_user_key_bindings
   bind --erase --all
   bind --erase --all --preset

   bind "" self-insert
   bind space self-insert expand-abbr
   bind shift-space "commandline -i ' '"
   bind ";" self-insert expand-abbr
   bind "|" self-insert expand-abbr
   bind "&" self-insert expand-abbr
   bind ">" self-insert expand-abbr
   bind "<" self-insert expand-abbr
   bind ")" self-insert expand-abbr
   bind up up-or-search
   bind down down-or-search
   bind left backward-char
   bind right forward-single-char
   bind alt-w up-or-search
   bind alt-s down-or-search
   bind alt-a backward-char
   bind alt-d forward-char
   bind ctrl-left backward-token
   bind ctrl-right forward-token
   bind alt-left prevd-or-backward-word
   bind alt-right nextd-or-forward-word
   bind home beginning-of-line
   bind end end-of-line
   bind backspace backward-delete-char
   bind shift-backspace backward-delete-char
   bind ctrl-backspace backward-kill-token
   bind alt-backspace backward-kill-word
   bind delete history-delete or kill-word
   bind enter execute
   bind ctrl-enter execute
   bind escape suppress-autosuggestion or cancel
   bind tab _accept_or_complete_or_history
   bind shift-tab complete-and-search
   bind ctrl-space accept-autosuggestion
   bind ctrl-h history-pager
   bind ctrl-z undo
   bind ctrl-y redo
   bind ctrl-shift-c clear-commandline
   bind ctrl-l clear-screen
   bind f1 __fish_man_page
end

function fish_prompt
   set -l color_cwd $fish_color_cwd
   if fish_is_root_user
      set color_cwd $fish_color_cwd_root
   end
   echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) " "
end

function preexec_test --on-event fish_preexec
   set -l time (date +" %H:%M:%S")
   set -l col (math $COLUMNS - (string length $time) + 1)
   printf "\e[1A\e[%dG" $col
   set_color brblack
   printf "%s" $time
   set_color normal
   printf "\e[1B\r\n"
end

function postexec_test --on-event fish_postexec
   if not string match -qr '^clear|^exit' $argv[1]
      _separator
   end
end

function _separator
   set_color brblack
   string repeat -n $COLUMNS '─'
   set_color normal
end

function _accept_or_complete_or_history
   if test -z (commandline)
      commandline -f history-pager
      return
   end

   if commandline --paging-mode
      commandline -f execute
      return
   end

   set -l cursor (commandline --cursor)
   commandline -f accept-autosuggestion
   if test (commandline --cursor) -eq $cursor
      commandline -f complete-and-search
   end
end

if test $SHLVL -gt 2
   _separator
end
