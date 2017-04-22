set -gx GOPATH ~

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
  rbenv rehash >/dev/null ^&1
end

if type -q pyenv
  status --is-interactive; and . (pyenv init -|psub)
end
