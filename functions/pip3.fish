function pip3 --wraps="pip3"
    switch $argv[1]
        case 'search'
            if not command -v pip_search >/dev/null
                pip3 install pip_search >/dev/null 2>/dev/null
            end
            pip_search $argv[2..]
        case '*'
            command pip3 $argv
    end
end
