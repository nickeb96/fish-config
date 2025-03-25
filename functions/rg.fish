function rg --wraps=rg
    if status is-interactive && isatty stdout
        command rg --color=always --heading --line-number $argv | less -RXF
    else
        command rg $argv
    end
end
