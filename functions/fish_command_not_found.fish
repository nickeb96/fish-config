
switch (uname -s)
    case Darwin
        # disabling this because homebrew is slow af
        # if command -q brew && string match -q -- 'homebrew/command-not-found' (brew tap)
        #     function _local_command_not_found
        #         brew which-formula --explain $argv
        #     end
        # end
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
