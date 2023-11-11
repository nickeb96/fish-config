status is-interactive || exit

# better version of bind ... cancel or kill-whole-line
function _cancel_or_kill_whole_line_custom
    if commandline --search-mode || commandline --paging-mode
        commandline -f cancel
    else
        commandline -f kill-whole-line
    end
end

bind \cv edit_command_buffer
bind \cc _cancel_or_kill_whole_line_custom
bind \co insert-line-over
bind \cl 'begin ; end'

bind \e\cf forward-word
bind \e\cb backward-word
bind \e\cd kill-word
bind \cd delete-char

bind \ct _override_tab
bind \cs accept-autosuggestion
