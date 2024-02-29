function diff --wraps=diff
    if status is-interactive && isatty stdout
        command diff --color=always $argv | less -RXF
    else
        command diff $argv
    end
end
