function rg --wraps=rg
    if status is-interactive && isatty stdout
        command rg --color=always $argv | less -RXSF
    else
        command rg $argv
    end
end
