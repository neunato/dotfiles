#!/bin/bash

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
   for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
      [[ -x "$f" ]] && . "$f"
   done
   unset f
fi

set-background
exec i3
