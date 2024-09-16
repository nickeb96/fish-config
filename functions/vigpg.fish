function vigpg -a file -d 'View and modify encrypted *.gpg files with vi'
    if not string length -q -- $file
        echo 'Must specify a *.gpg file to edit.' >&2
        return 1
    end

    if [ (count $argv) -gt 1 ]
        echo 'Only accepts one file at a time.' >&2
        return 1
    end

    if not string match -q '*.gpg' -- $file
        echo 'Not a *.gpg file' >&2
        return 1
    end

    set -l len (string length -- $file)
    set -l pid $fish_pid

    set temp_dir (mktemp -d -t "vigpg-$pid-XXXXXX")
    chmod u=rwx,go= $temp_dir

    set -l file_base (basename -s .gpg $file)
    set -l temp_file $temp_dir/$file_base
    touch $temp_file
    chmod u=rw,go= $temp_file

    if test -f $file -a -s $file
        gpg --yes -o $temp_file -d $file
    end

    set -l start (stat -c '%Y' $temp_file)

    vi -c 'set noswapfile' -c 'set viminfo=' \
        -c 'set statusline=%t\ %m%=%y\ \ \ %-14.(%l:%c%V%)\ %P' -- $temp_file

    set -l stop (stat -c '%Y' $temp_file)

    if [ $stop -gt $start ]
        gpg --yes --default-recipient-self -o $file -e $temp_file
    end

    rm $temp_file
    rmdir $temp_dir
end
