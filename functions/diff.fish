function diff --wraps=diff
    if status is-interactive && isatty stdout
        command diff --color=always $argv | less -RXFQ --mouse
    else
        command diff $argv
    end
end
