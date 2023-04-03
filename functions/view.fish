function view --wraps=nvim
    if type -q nvim
        command nvim -Rm $argv
    else
        command view $argv
    end
end
