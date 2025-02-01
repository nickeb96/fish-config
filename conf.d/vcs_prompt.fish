status is-interactive || exit

set -g __fish_git_prompt_describe_style branch
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showupstream git

set -g __fish_git_prompt_char_cleanstate ''
set -g __fish_git_prompt_char_stagedstate \u2713
set -g __fish_git_prompt_char_dirtystate \u2717
set -g __fish_git_prompt_char_untrackedfiles \u2205
set -g __fish_git_prompt_char_stashstate \u00a2
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_upstream_ahead \u2192
set -g __fish_git_prompt_char_upstream_behind \u2190
set -g __fish_git_prompt_char_upstream_diverged \u2194
set -g __fish_git_prompt_char_upstream_equal ''

set -g __fish_git_prompt_color_stagedstate green
set -g __fish_git_prompt_color_stagedstate_done normal
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_dirtystate_done normal
set -g __fish_git_prompt_color_untrackedfiles red
set -g __fish_git_prompt_color_untrackedfiles_done normal
set -g __fish_git_prompt_color_stashstate blue
set -g __fish_git_prompt_color_stashstate_done normal
set -g __fish_git_prompt_color_upstream yellow
set -g __fish_git_prompt_color_upstream_done normal
