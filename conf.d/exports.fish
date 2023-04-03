set -gx EDITOR nvim
set -gx PAGER less
set -gx LESSHISTFILE /dev/null

set -gx CPATH ~/.local/include
set -gx CPLUS_INCLUDE_PATH ~/.local/include/c++
set -gx DYLD_LIBRARY_PATH ~/.local/lib
set -gx LD_LIBRARY_PATH ~/.local/lib
set -gx LIBRARY_PATH ~/.local/lib

set -gx PYTHONPATH ~/.local/lib/python3
set -gx PYTHONSTARTUP ~/.config/python/startup.py

# if command -q nvim
#     set -gx MANPAGER "nvim +Man!"
# end

set -q rsync_options
or set -g rsync_options --times --crtimes --open-noatime \
    --perms --owner --group --links --recursive
