# this file starts with 00 so it is loaded before everything else

if not set -q fisher_path
    if set -q XDG_DATA_HOME
        set -g fisher_path $XDG_DATA_HOME/fisher
    else
        set -g fisher_path ~/.local/share/fisher
    end
end

if not contains $fisher_path/functions $fish_function_path
    set --append fish_function_path $fisher_path/functions
end

if not contains $fisher_path/completions $fish_complete_path
    set --append fish_complete_path $fisher_path/completions
end

for conf in $fisher_path/conf.d/*.fish
    source $conf
end

if status is-interactive && not functions -q fisher
    echo 'fisher not installed, installing now'
    set -l src 'https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish'
    curl -s $src | source
    fisher update
end
