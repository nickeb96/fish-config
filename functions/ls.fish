function ls --wraps=ls
    if command -q gls
        command gls -v --color=auto $argv
    else
        command ls --color=auto $argv
    end
end
