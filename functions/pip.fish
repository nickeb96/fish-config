if not command -q pip3 pip
    exit
end

function pip --wraps=pip3
    command -s pip3 pip | read --line -l pip
    if string match -q -- 'search' $argv[1]
        if not command $pip show --quiet pip_search &>/dev/null
            command $pip install --user --break-system-packages pip_search >/dev/null 2>/dev/null
        end
        python -m pip_search --date_format '%m/%d/%Y' $argv[2..]
    else
        command $pip $argv
    end
end
