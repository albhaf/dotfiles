set -gx GOPATH ~

if test -e /opt/homebrew/bin
  set -gx PATH /opt/homebrew/bin $PATH
end

if test -e ~/bin
  set -gx PATH ~/bin $PATH
end

if test -e ~/.cargo/bin
  set -gx PATH ~/.cargo/bin $PATH
end

if test -e ~/.multirust/toolchains/stable/cargo/bin
  set -gx PATH ~/.multirust/toolchains/stable/cargo/bin $PATH
end

if test -e ~/.rbenv/shims
  set -gx PATH ~/.rbenv/shims $PATH
end

if type -q rbenv
  rbenv rehash >/dev/null
end

if type -q pyenv
  set -Ux PYENV_ROOT $HOME/.pyenv
  set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  status is-login; and pyenv init --path | source
  pyenv init - | source
end

if type -q jenv
  set -gx PATH ~/.jenv/bin $PATH
  jenv init - | source
end

set -gx LLVM "/usr/local/opt/llvm/bin"

set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx PATH $PATH $ANDROID_HOME/tools
set -gx PATH $PATH $ANDROID_HOME/tools/bin
set -gx PATH $PATH $ANDROID_HOME/platform-tools

set -x fish_user_paths (printf '%s\n' $fish_user_paths | sort -u)
