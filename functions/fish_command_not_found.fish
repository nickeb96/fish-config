
switch (uname -s)
    case Darwin
        if command -q brew
            function _local_command_not_found
                # homebrew is very slow, so only run if the same command is called twice
                set -l previous (string sub --length=(string length -- $argv[1]) -- "$history[1]")
                if [ "$argv[1]" = "$previous" ]
                    brew which-formula --explain $argv[1]
                    or __fish_default_command_not_found_handler $argv
                else
                    __fish_default_command_not_found_handler $argv
                end
            end
        end
    case Linux
        if command -q command-not-found
            function _local_command_not_found
                command-not-found -- $argv[1]
            end
        end
end

function fish_command_not_found
    if functions -q _local_command_not_found
        _local_command_not_found $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end
