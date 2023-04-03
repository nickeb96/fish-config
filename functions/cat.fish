function cat --wraps=cat --description 'Fold markdown files instead of cat when interactive'
    if status is-interactive
        # if there are more than 0 input files and they are all markdown, use
        # fold instead
        set -l markdown 0
        for arg in $argv
            if string match -q -- "*.md" $arg
                set markdown 1
            else
                set markdown 0
                break
            end
        end
        if [ $markdown -eq 1 ] && command -q fold
            set -q COLUMNS
            or set -l COLUMNS 80
            # round down to nearest multiple of 8 for fold
            set width (math "bitand($COLUMNS, 0xFFFFFFF8)")
            command fold -s -w $width $argv
        else
            command cat $argv
        end
    else
        command cat $argv
    end
end
