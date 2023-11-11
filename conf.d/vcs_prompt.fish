status is-interactive || exit

set -g __fish_git_prompt_describe_style branch

set -g __fish_git_prompt_char_cleanstate ''
set -g __fish_git_prompt_char_stagedstate \u2713
set -g __fish_git_prompt_char_dirtystate \u2717
set -g __fish_git_prompt_char_untrackedfiles \u2610
set -g __fish_git_prompt_char_stashstate \u00a2
set -g __fish_git_prompt_char_stateseparator ' '

set -g __fish_git_prompt_color_stagedstate green
set -g __fish_git_prompt_color_stagedstate_done normal
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_dirtystate_done normal
set -g __fish_git_prompt_color_untrackedfiles red
set -g __fish_git_prompt_color_untrackedfiles_done normal
