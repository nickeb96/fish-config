function make --wraps=make --description 'Look for a Makefile up to $make_search_depth directories back and run make there'
    if status is-interactive && isatty stdin && isatty stdout
        set -l make_command make
        if command -q gmake
            set make_command gmake
        end
        set -q make_search_depth
        or set -l make_search_depth 5

        set -l path $PWD
        for i in (seq $make_search_depth)
            if test -f $path/Makefile
                break
            else
                set path (dirname $path)
            end
        end

        if test -f $path/Makefile
            fish -C "cd $path" -c "command $make_command \$argv" -- $argv
        else
            command $make_command $argv
        end
    else
        command make $argv
    end
end
