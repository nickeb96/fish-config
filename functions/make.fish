function make --wraps=make --description 'Look for a Makefile up to $make_search_depth directories back and run make there'
    if status is-interactive
        set -l make_command make
        if command -q gmake
            set make_command gmake
        end
        set -q make_search_depth
        or set -l make_search_depth 5
        if status is-interactive
            pushd .
            for i in (seq $make_search_depth)
                if test -f Makefile
                    command $make_command $argv
                    set -l exit_status $status
                    popd
                    return $exit_status
                else
                    cd ..
                end
            end
            popd
        end
        command $make_command $argv
    else
        command make $argv
    end
end
