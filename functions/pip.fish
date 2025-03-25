if not command -q pip3 pip
    exit
end

function pip --wraps=pip3
    if command -q pip3
        command pip3 $argv
    else
        command pip $argv
    end
end
