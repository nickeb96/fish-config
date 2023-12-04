function pip --wraps=pip3
    set -l pipcmd (command -v pip || command -v pip3 || echo pip)
    if string match -q -- 'search' $argv[1]
        if not command -q pip_search
            command $pipcmd install pip_search >/dev/null 2>/dev/null
        end
        pip_search --date_format '%m/%d/%Y' $argv[2..]
    else
        command $pipcmd $argv
    end
end
