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

PYTHON_HISTORY="$XDG_DATA_HOME/.python_history"
NODE_REPL_HISTORY="$XDG_DATA_HOME/.node_repl_history"
NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
MPV_HOME="$XDG_CONFIG_HOME/mpv"
WGETRC="$XDG_CONFIG_HOME/wgetrc"
CUDA_CACHE_PATH="$XDG_CACHE_HOME/nvidia"

GDK_DEBUG=portals
GTK_USE_PORTAL=1

set +a
