function vi --wraps=nvim
    if type -q nvim
        command nvim $argv
    else
        command vi $argv
    end
end
