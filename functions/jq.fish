function jq --wraps=jq
    if isatty stdout
        command jq --color-output $argv | less -RXSF
    else
        command jq $argv
    end
end
