status is-interactive || exit

function __forward_bigword_custom
    set -l cmd (commandline)
    set -l length (string length -- "$cmd")
    set -l cursor (math "$(commandline -C) + 1")
    while [ "$(string sub --start=$cursor --length=1 -- "$cmd")" != ' ' ] && [ $cursor -le $length ]
        set cursor (math "$cursor + 1")
    end
    while [ "$(string sub --start=$cursor --length=1 -- "$cmd")" = ' ' ] && [ $cursor -lt $length ]
        set cursor (math "$cursor + 1")
    end
    commandline -C (math "$cursor - 1")
end

bind \ce edit_command_buffer
bind \cc cancel or kill-whole-line
bind \cb backward-bigword
bind \cw __forward_bigword_custom
