status is-interactive || exit

function _ctrl_c
    if commandline --search-mode || commandline --paging-mode
        commandline -f cancel
    else
        commandline -f kill-whole-line
    end
end

function _ctrl_n
    if commandline --search-mode
        commandline -f history-search-forward
    else if commandline --paging-mode
        # scroll down in pager
        commandline -f down-line
    else if [ (commandline | count) -gt 1 ]
        # move cursor down in prompt buffer
        commandline -f down-line
    else
        commandline -f complete
    end
end

function _ctrl_p
    if commandline --search-mode
        commandline -f history-search-backward
    else if commandline --paging-mode
        commandline -f up-line
    else if [ (commandline --line) -eq 1 ]
        # history search if cursor is in top line
        commandline -f history-search-backward
    else
        commandline -f up-line
    end
end


bind \cv edit_command_buffer
bind \cc _ctrl_c
bind \co insert-line-over
bind \cl 'begin ; end'  # no-op

bind \e\cf forward-word
bind \e\cb backward-word
bind \e\cd kill-word
bind \cd delete-char

bind \ct _override_tab
bind \cs accept-autosuggestion

bind \cn _ctrl_n
bind \cp _ctrl_p
