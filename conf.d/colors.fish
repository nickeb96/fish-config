status is-interactive || exit

if string match -q 'alacritty*' -- $TERM
    set -g fish_term24bit 1
end

set -gx LS_COLORS 'no=00:fi=00:rs=0:di=34:ln=36:mh=01:pi=35:so=35:do=35:bd=33;01:cd=33:or=31:mi=90:su=32;01:sg=32;01:tw=34;01:ow=34:st=34;01:ex=32:'
set -gx LSCOLORS 'exgxfxfxcxDxdxCxCxExex'
