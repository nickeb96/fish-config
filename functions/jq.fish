function jq --wraps=jq
    if status is-interactive && isatty stdout
        command jq --color-output $argv | less -RXF
    else
        command jq $argv
    end
end
