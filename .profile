set -a

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XDG_CONFIG_DIRS="/etc/xdg"
source "$XDG_CONFIG_HOME/user-dirs.dirs"

PYTHON_HISTORY="$XDG_DATA_HOME/.python_history"
NODE_REPL_HISTORY="$XDG_DATA_HOME/.node_repl_history"
NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
VOLTA_HOME="$HOME/.volta"
DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
MPV_HOME="$XDG_CONFIG_HOME/mpv"
WGETRC="$XDG_CONFIG_HOME/wgetrc"
CUDA_CACHE_PATH="$XDG_CACHE_HOME/nvidia"

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
SSH_ASKPASS="$HOME/scripts/rofi-askpass"
SSH_ASKPASS_REQUIRE="force"

QT_QPA_PLATFORMTHEME=gtk3

if [[ ! ":$PATH:" =~ ":$HOME/scripts:" ]]; then
	PATH="$VOLTA_HOME/bin:${PATH}:$HOME/scripts"
fi

if [[ -n "$DISPLAY" ]]; then
	EDITOR="/usr/bin/zeditor"
else
	EDITOR="/usr/bin/nano"
fi

if [[ ! -f /etc/udev/rules.d/no-nvidia.rules ]]; then
   GBM_BACKEND=nvidia-drm
   __GLX_VENDOR_LIBRARY_NAME=nvidia
   __NV_PRIME_RENDER_OFFLOAD=1
   __VK_LAYER_NV_optimus=NVIDIA_only
fi

set +a
