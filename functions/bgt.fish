function bgt --description 'Spawn a background terminal'
    switch $argv[1]
        case -k --kill
            return
    end
    if not set -q bgt
        set -l alacritty_options \
            -o window.dimensions.columns=80 \
            -o window.dimensions.lines=40 \
            -o window.position.x=0 \
            -o window.position.y=0 \
            -o window.title=bgt \
            -o cursor.style.shape=Beam \
            -o scrolling.history=1000 \
            --working-directory $PWD

        set -l other_options \
            -o cursor.style.unfocused_hollow=false \
            --hold

        alacritty $alacritty_options --command fish -c _bgt_command &
        set -l parent_pid (ps -o ppid= -p $fish_pid)
        sleep 0.05
        echo "
            tell application \"System Events\"
                set processList to every process whose unix id is $parent_pid
                repeat with proc in processList
                    set the frontmost of proc to true
                end repeat
            end tell
        " | osascript
    end
    if [ (count $argv) -gt 0 ]
        while not set -q bgt
            sleep 0.1
        end
        command $argv &>$bgt &
    end
end
