status is-interactive || exit

# better version of bind ... cancel or kill-whole-line
function _cancel_or_kill_whole_line_custom
    if commandline --search-mode || commandline --paging-mode
        commandline -f cancel
    else
        commandline -f kill-whole-line
    end
end

# better version of bind ... forward-bigword
function _forward_bigword_custom
    if commandline --search-mode || commandline --paging-mode
        commandline -f forward-word
    else
        set -l cmd (commandline)
        set -l len (string length -- "$cmd")
        set -l cur (math "$(commandline -C) + 1")
        while [ "$(string sub --start=$cur --length=1 -- "$cmd")" != ' ' ] && [ $cur -le $len ]
            set cur (math "$cur + 1")
        end
        while [ "$(string sub --start=$cur --length=1 -- "$cmd")" = ' ' ] && [ $cur -lt $len ]
            set cur (math "$cur + 1")
        end
        commandline -C (math "$cur - 1")
    end
end

function _bigword_end_custom
    if not commandline --search-mode && not commandline --paging-mode
        set -l cmd (commandline)
        set -l len (string length -- "$cmd")
        set -l cur (math "$(commandline -C) + 1")
        while [ "$(string sub --start=(math "$cur + 1") --length=1 -- "$cmd")" = ' ' ] && [ $cur -le $len ]
            set cur (math "$cur + 1")
        end
        while [ "$(string sub --start=(math "$cur + 1") --length=1 -- "$cmd")" != ' ' ] && [ $cur -lt $len ]
            set cur (math "$cur + 1")
        end
        commandline -C (math "$cur - 1")
    end
end

function _delete_to_end_or_exit
    if test -n "$(commandline)"
        commandline -f kill-line
    else
        commandline -f exit
    end
end

function _next_custom
    if commandline --search-mode || commandline --paging-mode
        commandline -f down-line
    else if test -z "$(commandline)"
        commandline -f down-line
    else
        commandline -f complete
    end
end


bind \cv edit_command_buffer
bind \cc _cancel_or_kill_whole_line_custom
bind \cd _delete_to_end_or_exit
bind \cw _forward_bigword_custom
bind \cb backward-bigword
bind \ce _bigword_end_custom
bind \co insert-line-over
bind \cj down-line
bind \ck up-line
bind \ch backward-char
bind \cl forward-char
bind \cf accept-autosuggestion
# bind \cn down-or-search and complete

# bind \e\[13\;5u 'commandline -i \n'
# bind \e\[32\;5u 'commandline -i \ '

