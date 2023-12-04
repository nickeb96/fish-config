function python --wraps=python3
    if command -q python
        command python $argv
    else
        command python3 $argv
    end
end
