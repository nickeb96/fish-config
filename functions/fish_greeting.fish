function fish_greeting
    set -l todo ~/notes/todo.md
    if test -f $todo
        cat $todo
    end
    if type -q when
        when
    end
end
