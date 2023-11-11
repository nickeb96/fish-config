function rg --wraps=rg
    if isatty stdout
        command rg --color=always $argv | less -RXSF
    else
        command rg $argv
    end
end
