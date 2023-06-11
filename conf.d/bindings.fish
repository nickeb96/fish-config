status is-interactive || exit

# better version of bind ... forward-bigword
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

# better version of bind ... cancel or kill-whole-line
function __cancel_or_kill_line
    if commandline --search-mode || commandline --paging-mode
        commandline -f cancel
    else
        commandline -f kill-whole-line
    end
end

bind \ce edit_command_buffer
bind \cc __cancel_or_kill_whole_line_custom
bind \cb backward-bigword
bind \cw __forward_bigword_custom
bind \co insert-line-over
bind \cj down-line
bind \ck up-line
bind \ch backward-char
bind \cl forward-char
bind \cf accept-autosuggestion
