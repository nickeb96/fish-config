status is-interactive || exit

function _verify_quit
    if not set -q _ctrl_d_pressed
        set -g _ctrl_d_pressed 1
        if functions -q fish_right_prompt
            functions -c fish_right_prompt _old_fish_right_prompt
        end
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
            if functions -q _old_fish_right_prompt
                functions -c _old_fish_right_prompt fish_right_prompt
                functions -e _old_fish_right_prompt
            end
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


function _user_key_bindings --on-variable fish_key_bindings
    bind -m default \cv edit_command_buffer
    bind -m default \co insert-line-over
    if string match -q '4*' $FISH_VERSION
        bind -m default ctrl-enter 'commandline --insert \\n'
        bind -m default ctrl-space 'commandline --insert " "'
    end
    bind -m default \cl 'begin ; end'  # no-op

    bind -m default \cc _ctrl_c
    bind -m default \cn _ctrl_n
    bind -m default \cp _ctrl_p

    bind -m default \e\cf forward-word
    bind -m default \e\cb backward-word
    bind -m default \e\cd kill-word
    bind -m default \cd _ctrl_d
    bind -m default \e\ch backward-kill-word

    bind -m default \cs accept-autosuggestion
    bind -m default \e\cm __fish_man_page
    bind -m default \e\cs 'fish_commandline_prepend sudo'
end

_user_key_bindings
