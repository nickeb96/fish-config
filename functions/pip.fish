function pip --wraps=pip3
    if string match -q 'search' $argv[1]
        if not command -q pip_search
            command pip3 install pip_search >/dev/null 2>/dev/null
        end
        pip_search $argv[2..]
    else
        command pip3 $argv
    end
end
