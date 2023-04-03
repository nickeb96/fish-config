function fish_greeting
    if test -f ~/.todo.md && test -s ~/.todo.md
        echo '#### To Do List ####'
        cat ~/.todo.md
        echo
    end
    if type -q when
        when
    end
end
