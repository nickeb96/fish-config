function fish_greeting
    if command -q tmux && tmux has-session &>/dev/null
        echo tmux session exists
    end
end
