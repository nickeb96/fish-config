function ascii -d 'Print an ascii table'
    set -l fmt '%d'
    if count $argv >/dev/null && [ $argv[1] = hex ]
        set fmt '%x'
    end
    set -l columns 8
    set -l rows 12
    for offset in (seq 32 $columns 127)
        for i in (seq $offset (math "$offset + $columns - 1"))
            printf "$fmt \\"(printf '%03o' $i)'\t  ' $i
        end
        printf '\n'
    end
end
