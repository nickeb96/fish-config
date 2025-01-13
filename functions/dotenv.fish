function dotenv -d 'Tool for working with .env files'
    set -l subcmd $argv[1]
    switch "$subcmd"
        case prompt
            if set -q _dotenv_sourced_path
                set -l brackets '(' ')'
                if set -q _dotenv_auto_sourced
                    set brackets '[' ']'
                end
                printf '%s%s/%s%s' \
                    $brackets[1] \
                    (path dirname $_dotenv_sourced_path | path basename) \
                    (path basename $_dotenv_sourced_path) \
                    $brackets[2]
            end

        case source
            set -l env_file $argv[2]
            if not string length -q -- $env_file
                set env_file .env
            end
            # echo sourcing $env_file ...
            if not test -e $env_file
                echo "dotenv: $env_file does not exist" >&2
                return 1
            end
            if set -g -q _dotenv_sourced_path
                echo 'dotenv: Unsourcing previous env...' >&2
                dotenv unsource
            end
            set -g _dotenv_sourced_path $PWD/$env_file
            set -g _dotenv_sourced_variables
            cat .env | while read --line line
                if string match -q --regex '^\s*#.*' -- $line
                    echo Comment: $line
                else if string match -q --regex '^\s*$' -- $line
                    echo Empty line
                else if string match -q --regex '^\s*(export\s+)?(?<var_name>[A-Za-z0-9_]+)=(?<var_value>.*)$' -- $line
                    set -ga _dotenv_sourced_variables $var_name
                    # string replace --regex '\$\w+'
                    set -gx $var_name "$(string unescape --style=script -- $var_value)"
                else
                    echo Invalid line
                end
            end

        case unsource
            # echo unsourcing...
            if not set -gq _dotenv_sourced_path
                echo 'dotenv: Nothing to unsource' >&2
                return 1
            end
            for var in $_dotenv_sourced_variables
                set -ge $var
            end
            set -ge _dotenv_sourced_variables
            set -ge _dotenv_sourced_path
            set -ge _dotenv_auto_sourced

        case enable-auto
            function _dotenv_auto_sourcer --on-variable=PWD
                if set -gq _dotenv_auto_sourced
                    set -l env_dir (path dirname $_dotenv_sourced_path)
                    if [ "$(string sub -l (string length $env_dir) -- $PWD)" != $env_dir ]
                        dotenv unsource
                    end
                end
                if ! set -gq _dotenv_sourced_path && test -e .env
                    dotenv source
                    set -g _dotenv_auto_sourced
                end
            end

        case disable-auto
            functions -e _dotenv_auto_sourcer

        case list
            for var_name in $_dotenv_sourced_variables
                printf '%s\n' $var_name
            end

        case help
            echo 'TODO: write help docs'

        case -q
            set -q _dotenv_sourced_path
            return $status

        case '*'
            return 1
    end
end
