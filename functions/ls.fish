function ls
    if command -q exa
        command exa --sort=Name --links --group --time-style=american --git $argv
    else if command -q gls
        command gls --color=auto $argv
    else
        command ls --color=auto $argv
    end
end
