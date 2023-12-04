set -gx EDITOR nvim
set -gx PAGER less
set -gx LESSHISTFILE /dev/null
set -gx SQLITE_HISTORY /dev/null
set -gx PSQL_HISTORY /dev/null

set -gx CPATH ~/.local/include /opt/homebrew/include
set -gx CPLUS_INCLUDE_PATH ~/.local/include/c++ /opt/homebrew/include/c++
set -gx DYLD_LIBRARY_PATH ~/.local/lib /opt/homebrew/lib
set -gx LD_LIBRARY_PATH ~/.local/lib /opt/homebrew/lib
set -gx LIBRARY_PATH ~/.local/lib /opt/homebrew/lib

set -gx PYTHONPATH ~/.local/lib/python3
set -gx PYTHONSTARTUP ~/.config/python/startup.py
set -gx PYTHONDONTWRITEBYTECODE 1

set -gx GPG_TTY (tty)

# if command -q nvim
#     set -gx MANPAGER "nvim +Man!"
# end

set -q rsync_options
or set -g rsync_options --times --crtimes --open-noatime \
    --perms --owner --group --links --recursive --cvs-exclude --progress

contains qmark-noglob $fish_features
or set -a fish_features qmark-noglob

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
