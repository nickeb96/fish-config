if command -q nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vi
end
set -gx PAGER less
set -gx LESSHISTFILE /dev/null
set -gx SQLITE_HISTORY /dev/null
set -gx PSQL_HISTORY /dev/null

set -gx PYTHONPATH ~/.local/lib/python3
set -gx PYTHONSTARTUP ~/.config/python/startup.py
set -gx PYTHONDONTWRITEBYTECODE 1

if string match -- Darwin (uname -s)
    set -gx HOMEBREW_NO_AUTO_UPDATE 1
    set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
end

if status is-interactive
    set -gx GPG_TTY (tty)
end

set -q rsync_options
or set -g rsync_options --times --crtimes --open-noatime \
    --perms --owner --group --links --recursive --cvs-exclude --progress

contains qmark-noglob $fish_features
or set -a -U fish_features qmark-noglob

fish_add_path ~/.local/bin ~/.cargo/bin \
    /usr/local/bin /usr/local/sbin \
    /opt/homebrew/bin /opt/homebrew/sbin
