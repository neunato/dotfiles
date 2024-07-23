#!/bin/bash

set -x

if [[ -z $4 ]]; then
   kitty yazi --chooser-file="$5"
else
   kitty bash -c "
      read -p 'Save to \"$4\"? ' -i y -e continue
      if [[ \$continue == 'y' ]]; then
         echo '$4' > '$5'
      else
         yazi --chooser-file=\"$5\" \"$4\"
      fi
   "
fi
