function _bgt_command
    function _on_exit --on-process-exit %self
        set -e bgt
        exit
    end
    set -U bgt (tty)
    command cat - >/dev/null
end
