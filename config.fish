set -gx GOPATH ~

set -gx PATH $GOPATH/bin ~/.cargo/bin ~/.multirust/toolchains/stable/cargo/bin $PATH

set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
status --is-interactive; and . (pyenv init -|psub)
