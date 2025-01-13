
fish_add_path ~/.local/bin \
    ~/.cargo/bin \
    /usr/local/bin /usr/local/sbin \
    /opt/homebrew/bin /opt/homebrew/sbin

command -q nvim
and set -gx EDITOR nvim
or set -gx EDITOR vi

set -gx PAGER less
set -gx LESSHISTFILE /dev/null
set -gx SQLITE_HISTORY /dev/null
set -gx PSQL_HISTORY /dev/null
set -gx PYTHON_HISTORY /dev/null
set -gx PYTHONPATH ~/.local/lib/python
set -gx PYTHONSTARTUP ~/.config/python/startup.py
set -gx PYTHONDONTWRITEBYTECODE 1

set -gx LUA_PATH "$HOME/.local/lib/lua/?.lua;$HOME/.local/lib/lua/?/init.lua;;"
set -gx LUA_CPATH "$HOME/.local/lib/lua/?.so;;"
set -gx LUA_INIT "@$HOME/.config/lua/startup.lua"

set -gx GPG_TTY (tty)

if string match -q -- Darwin (uname -s)
    set -gx HOMEBREW_NO_AUTO_UPDATE 1
    set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
    set -gx HOMEBREW_NO_INSTALL_UPGRADE 1
end

set -g rsync_options --times --crtimes --open-noatime \
    --perms --owner --group --links --recursive --cvs-exclude --progress

contains qmark-noglob $fish_features
or set -a -U fish_features qmark-noglob
contains remove-percent-self $fish_features
or set -a -U fish_features remove-percent-self
