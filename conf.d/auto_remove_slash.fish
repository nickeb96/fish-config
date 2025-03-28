status is-interactive || exit

function _override_space
    set -l cmd (commandline --cut-at-cursor)
    set -l split (string split -- ' ' $cmd)
    switch $split[-1]
        case '*/'
            if [ "$_tab_pressed_last" = true ]
                set -g _tab_pressed_last false
                set -l length (math "$(string length $cmd) - 1")
                set -l new_cmd (string sub --length $length $cmd)
                commandline --replace $new_cmd
            end
            commandline -f expand-abbr
            commandline --insert ' '
        case '*'
            commandline -f expand-abbr
            commandline --insert ' '
    end
end

function _override_enter
    set -l cmd (commandline --cut-at-cursor)
    set -l split (string split -- ' ' $cmd)
    switch $split[-1]
        case '*/'
            if [ "$_tab_pressed_last" = true ]
                set -g _tab_pressed_last false
                set -l length (math "$(string length $cmd) - 1")
                set -l new_cmd (string sub --length $length $cmd)
                commandline --replace $new_cmd
                commandline -f execute
            else
                commandline -f execute
            end
        case '*'
            commandline -f execute
    end
end

function _override_tab
    set -g _tab_pressed_last true
    if functions --query _autopair_tab
        _autopair_tab
    else
        commandline -f complete
    end
end

function _override_slash
    if [ "$_tab_pressed_last" = true ]
        set -l cmd (commandline --cut-at-cursor)
        if ! string match -q '*/' "$cmd"
            commandline --insert '/'
        else if commandline --paging-mode
            # this closes the pager
            commandline -f backward-delete-char
            commandline --insert '/'
        end
    else
        commandline --insert '/'
    end
    set -g _tab_pressed_last false
end

function _auto_remove_slash_key_bindings --on-variable fish_key_bindings
    bind -m default ' ' _override_space
    bind -m default \r _override_enter
    bind -m default \n _override_enter
    bind -m default enter _override_enter
    bind -m default \cm _override_enter
    bind -m default \cj _override_enter
    bind -m default ctrl-m _override_enter
    bind -m default ctrl-j _override_enter
    bind -m default \t _override_tab
    bind -m default tab _override_tab
    bind -m default '/' _override_slash
end

_auto_remove_slash_key_bindings

