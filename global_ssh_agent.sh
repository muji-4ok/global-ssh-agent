PROJ_DIR="$(dirname "$(realpath "$BASH_SOURCE")")"
GLOBAL_SSH_AUTH_SOCK_PATH="$PROJ_DIR/SSH_AUTH_SOCK"
GLOBAL_SSH_AGENT_PID_PATH="$PROJ_DIR/SSH_AGENT_PID"
unset PROJ_DIR

init_global_ssh_agent() {
    export SSH_AUTH_SOCK=`cat "$GLOBAL_SSH_AUTH_SOCK_PATH"`
    export SSH_AGENT_PID=`cat "$GLOBAL_SSH_AGENT_PID_PATH"`

    if [ ! -e "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent -s`
        echo "$SSH_AUTH_SOCK" > "$GLOBAL_SSH_AUTH_SOCK_PATH"
        echo "$SSH_AGENT_PID" > "$GLOBAL_SSH_AGENT_PID_PATH"
    fi
}

