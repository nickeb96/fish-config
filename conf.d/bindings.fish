status is-interactive || exit

function _verify_quit
    if not set -q _ctrl_d_pressed
        set -g _ctrl_d_pressed 1
        function fish_right_prompt
            if set -q _ctrl_d_pressed && [ $_ctrl_d_pressed -ge 2 ]
                echo (set_color --bold)'...[ctrl-d]'(set_color normal)
            else
                echo '...[ctrl-d]'
            end
        end
        function _reset_ctrl_d --on-event=fish_prompt --on-event=fish_cancel
            set -e _ctrl_d_pressed
            functions -e fish_right_prompt
            commandline -f repaint
            functions -e _reset_ctrl_d
        end
    else if [ $_ctrl_d_pressed -lt 1 ]
        set -g _ctrl_d_pressed (math "$_ctrl_d_pressed + 1")
    else
        exit 0
    end
    commandline -f repaint
end

function _ctrl_d
    if commandline | string length --quiet
        commandline -f delete-char
    else
        _verify_quit
    end
end

function _ctrl_c
    if commandline --search-mode || commandline --paging-mode
        commandline -f cancel
    else if commandline | string length --quiet
        commandline -f kill-whole-line
    else
        emit fish_cancel
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
        _override_tab
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
bind \co insert-line-over
bind \cl 'begin ; end'  # no-op

bind \cc _ctrl_c
bind \cn _ctrl_n
bind \cp _ctrl_p

bind \e\cf forward-word
bind \e\cb backward-word
bind \e\cd kill-word
bind \cd _ctrl_d

bind \cs accept-autosuggestion
bind \e\cm __fish_man_page
bind \e\cs 'fish_commandline_prepend sudo'
