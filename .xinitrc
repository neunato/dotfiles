#!/bin/bash

source "$HOME/.profile"

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
   for file in /etc/X11/xinit/xinitrc.d/?*.sh; do
      if [[ -x "$file" ]]; then
         source "$file"
      fi
   done
   unset file
fi

xrdb -merge -I"$HOME" "$HOME/.Xresources"
screen-layout --restore
exec i3
