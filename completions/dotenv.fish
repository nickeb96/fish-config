set -l subcommands prompt source unsource enable-auto disable-auto list query help
complete -c dotenv -f
complete -c dotenv -n "not __fish_seen_subcommand_from $subcommands" \
    -a '
    source\t"Source env file"
    unsource\t"Unsource previous env"
    enable-auto\t"Auto-source files"
    disable-auto\t"Disable enable-auto"
    list\t"List sourced vars"
    query\t"Test if an env has been sourced"
    prompt\t"Display a prompt"
    help\t"Display help"
    '
complete -c dotenv -n "__fish_seen_subcommand_from source" -F
complete -c dotenv -f -s q -d 'Test if an env has been sourced'
complete -c dotenv -f -s h -l help -d 'Display help'
