status is-interactive || exit

abbr -a cp 'cp -i'
abbr -a mv 'mv -i'
abbr -a rm 'rm -I'
abbr -a less 'less -RXSF'
abbr -a echon "printf '%s\n'"
abbr -a now "date '+%I:%M %p'"
abbr -a today "date '+%A - %m/%d/%y'"
abbr -a tree 'tree -C'
abbr -a cg 'cargo'
abbr -a http-server 'http-server -c-1'
abbr -a venv 'python -m venv .venv'
abbr -a ni 'neovide'

abbr -a md-html 'pulldown-cmark -TFSLPH'
abbr -a md-pdf 'pandoc -d md2pdf'
