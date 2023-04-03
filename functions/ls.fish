function ls --wraps=exa
    command exa --sort=Name --links --group --time-style=american --git $argv
end
