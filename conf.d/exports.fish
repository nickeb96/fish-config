fish_add_path --path --move \
    ~/.local/bin \
    ~/.cargo/bin \
    /usr/local/bin \
    /opt/homebrew/bin \
    /usr/bin \
    /bin \
    /usr/local/sbin \
    /opt/homebrew/sbin \
    /usr/sbin \
    /sbin

set -g fish_features qmark-noglob ampersand-nobg-in-token remove-percent-self

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

command -q rustpython
and set -gx RUSTPYTHONPATH /opt/homebrew/opt/python/Frameworks/Python.framework/Versions/Current/lib/(python -c 'import sys; print(f"python{sys.version_info.major}.{sys.version_info.minor}")')

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
    set -gx HOMEBREW_NO_ASK 1
end

