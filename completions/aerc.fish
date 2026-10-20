
# aerc options and subcommands can't be used after a runtime command (i.e. :new-account)
function __fish_complete_aerc_not_cmd
    set -l current_arg (string escape --style=regex -- (commandline -pxc)[2..] | string join '|')
    not string match -rq -- '^:.*$' "$current_arg"
end

complete -c aerc -f
complete -c aerc -n __fish_complete_aerc_not_cmd -s h -l help -d 'Show aerc usage help and exit'
complete -c aerc -n __fish_complete_aerc_not_cmd -s v -l version -d 'Print the installed version of aerc and exit'

function __fish_complete_aerc_accounts
    set -q XDG_CONFIG_DIR
    and set -l accounts_path $XDG_CONFIG_DIR/aerc/accounts.conf
    or set -l accounts_path ~/.config/aerc/accounts.conf
    command sed -n 's/^[[:space:]]*\[\([[:alnum:]_-]*\)\][[:space:]]*\(#.*\)\{0,1\}$/\1/p' $accounts_path
end

complete -c aerc -n __fish_complete_aerc_not_cmd -s a -l account -d 'Load only the named account' -fra '(__fish_complete_aerc_accounts)'
complete -c aerc -n __fish_complete_aerc_not_cmd -s C -l aerc-conf -Fr -d 'Specify an alternative config file'
complete -c aerc -n __fish_complete_aerc_not_cmd -s A -l accounts-conf -Fr -d 'Specify an altenative accounts file'
complete -c aerc -n __fish_complete_aerc_not_cmd -s B -l binds-conf -Fr -d 'Specify an altenative bindings file'
complete -c aerc -n __fish_complete_aerc_not_cmd -s I -l no-ipc -d 'Run over this instance rather than IPC'

complete -c aerc -n __fish_complete_aerc_not_cmd -a mailto: -d 'Open the composer directly'

function __fish_complete_aerc_mbox
    commandline -ct | string replace mbox: '' | read -l path
    printf 'mbox:%s\n' (complete -C "__fish_command_without_completions $path")
end

complete -c aerc -n __fish_complete_aerc_not_cmd -f -a mbox: -d 'Open an mbox as a virtual account'
complete -c aerc -n 'commandline -ct | string match -qe "mbox:*"' -f -a '(__fish_complete_aerc_mbox)'

# function __fish_complete_aerc_cmd
#     set -l commands help man new-account cd z change-tab ct exec echo eml preview \
#         pwd version send-keys term terminal move-tab prev-tab next-tab pin-tab \
#         unpin-tab prompt menu choose reload suspend quit exit q redraw archive \
#         accept accept-tentative copy cp decline delete delete-message envelope \
#         recall forward move mv patch pipe reply read unread flag unflag \
#         modify-labels tag unsubscribe align disconnect connect clear cf check-mail \
#         compose bounce resend recover filter mkdir rmdir next next-message prev \
#         prev-message next-folder prev-folder expand-folder collapse-folder \
#         export-mbox import-mbox next-result prev-result query search select \
#         select-message hsplit sort toggle-threads fold unfold toggle-thread-context \
#         view view-message vsplit close next prev next-part prev-part open copy-link \
#         open-link save mark unmark remark toggle-headers toggle-key-passthrough \
#         abort attach attach-key detach cc bcc edit multipart next-field prev-field \
#         postpone send switch-account header encrypt sign close
#     printf ':%s\n' $commands
# end
# complete -c aerc -n 'commandline -ct | string match -qe ":*"' -a '(__fish_complete_aerc_cmd)'

complete -c aerc -n 'commandline -ct | string match -qe ":*"' -a '
:new-account\t"Start the new account wizard"
:change-tab\t"Change open tab"
:ct\t"Change open tab"
:eml\t"Opens an eml file"
:preview\t"Opens an eml file"
:quit\t"Exit aerc"
:exit\t"Exit aerc"
:q\t"Exit aerc"
:cf\t"Change current folder"
:filter\t"Filter by search terms"
:export-mbox\t"Export messages to an mbox"
:import-mbox\t"Import messages from an mbox"
:search\t"Search for messages"
'

complete -c aerc -n '__fish_seen_subcommand_from :new-account' -s t -d 'Create a temporary account'
complete -c aerc -n '__fish_seen_subcommand_from :cf' -s a -a '(__fish_complete_aerc_accounts)'
complete -c aerc -n '__fish_seen_subcommand_from :export-mbox' -Fr -d 'mbox file'
complete -c aerc -n '__fish_seen_subcommand_from :import-mbox' -Fr -d 'mbox file'

