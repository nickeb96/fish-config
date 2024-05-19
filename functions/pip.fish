if not command -q pip3 pip
    exit
end

function pip --wraps=pip3
    command -s pip3 pip | read --line -l pipcmd
    # set -l pipcmd (command -s pip3 pip)[1]
    if string match -q -- 'search' $argv[1]
        if not command -q pip_search
            command $pipcmd install --user --break-system-packages pip_search >/dev/null 2>/dev/null
        end
        pip_search --date_format '%m/%d/%Y' $argv[2..]
    else
        command $pipcmd $argv
    end
end
