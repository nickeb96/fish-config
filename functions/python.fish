function python --wraps=python3
    if command -q python3
        command python3 $argv
    else
        command python $argv
    end
end
