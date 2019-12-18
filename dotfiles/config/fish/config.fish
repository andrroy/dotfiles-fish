set -g -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
#set -g -x PATH /usr/local/Cellar/gettext/0.19.8.1/bin $PATH

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8

#set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
#set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
#set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
#set -gx LDFLAGS "/usr/local/opt/openssl/lib"

set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
pyenv rehash

function !!
    eval sudo $history[1]
end

eval (python -m virtualfish compat_aliases auto_activation)

source $HOME/.config/fish/aliases.fish

eval (dircolors -c ~/.dir_colors)
