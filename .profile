set -a

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XDG_CONFIG_DIRS="/etc/xdg"
source "$XDG_CONFIG_HOME/user-dirs.dirs"

if [[ ! ":$PATH:" =~ ":$HOME/scripts:" ]]; then
	PATH="${PATH}:$HOME/scripts"
fi

if [[ -n "$DISPLAY" ]]; then
	EDITOR="/usr/bin/zeditor"
else
	EDITOR="/usr/bin/nano"
fi

GDK_DEBUG=portals
GTK_USE_PORTAL=1

set +a
