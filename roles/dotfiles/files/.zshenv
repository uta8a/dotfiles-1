export XDG_CACHE_HOME="$HOME/.cache"

# Do not clear the screen after quitting a man page
export MANPAGER="less -X"

# fzf
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!thirdparty/*"'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!thirdparty/*"'

# n(node version manager)
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/go"
export EDITOR="nvim"
export STARSHIP_CONFIG=~/.starship.toml
export GPG_TTY=$(tty)

typeset -gU PATH path

path=(
    "/bin"(N-/)
    "/sbin"(N-/)
    "/usr/bin"(N-/)
    "/usr/local/bin"(N-/)
    "/usr/local/sbin"(N-/)
    "/usr/sbin"(N-/)
    "${path[@]}"
)
path=(
    "$HOME/.cargo/bin"(N-/)
    "$HOME/.local/bin"(N-/)
    "$HOME/google-cloud-sdk/bin"(N-/)
    "$PYENV_ROOT/bin"(N-/)
    "$GOPATH/bin"(N-/)
    "${path[@]}"
)

# Linuxbrew
if [ $(uname) = "Linux" ]; then
    path=(
        "/home/linuxbrew/.linuxbrew/bin"(N-/)
        "${path[@]}"
    )
fi

