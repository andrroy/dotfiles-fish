
# Colors
fish_add_path /usr/local/opt/coreutils/libexec/gnubin
eval (dircolors -c ~/.dir_colors)

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8

# Zlib
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"

source $HOME/.config/fish/aliases.fish
# Export aliases for lazy-loading in child shells.
for alias in (grep -o "^alias \b\w\b" $HOME/.config/fish/aliases.fish | cut -c 7-)
    funcsave $alias
end

#source ~/.asdf/asdf.fish
#asdf exec direnv hook fish | source

#direnv hook fish
#rtx activate fish | source

rtx activate -s fish | source
direnv hook fish | source
starship init fish | source
