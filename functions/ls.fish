set -g _ls_cmd ls

switch (uname -s)
    case Darwin
        if command -q gls
            set -g _ls_cmd gls
            set -g _ls_args -v --color=auto
        else
            set -g _ls_args -G
        end
    case Linux
        set -g _ls_args -v --color=auto
end

function ls --wraps=ls
    command $_ls_cmd $_ls_args $argv
end
