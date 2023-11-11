function ls --wraps=ls
    # if command -q exa
    #     command exa --sort=Name --links --group --time-style=american --git $argv
    # else if command -q gls
    #     command gls --color=auto $argv
    # else
    #     command ls --color=auto $argv
    # end
    if command -q gls
        command gls -v --color=auto $argv
    else
        command ls -v --color=auto $argv
    end
end
