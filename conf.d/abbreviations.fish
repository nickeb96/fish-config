status is-interactive || exit

abbr -a cp 'cp -i'
abbr -a mv 'mv -i'
abbr -a rm 'rm -I'
abbr -a less 'less -RXSF'
abbr -a sed 'sed -E'
abbr -a echon "printf '%s\n'"
abbr -a now "date '+%-I:%M %p'"
abbr -a today "date +%Y-%m-%d"
abbr -a epoch 'date +%s'
abbr -a tree 'tree -C'
abbr -a cg 'cargo'
abbr -a http-server 'http-server -c-1'
# abbr -a http-server 'http-server -li --port=8080 --host=127.0.0.1'
abbr -a venv 'python -m venv .venv'
abbr -a ni 'neovide'

abbr -a md-html 'pulldown-cmark -TmFSLPHMRG'
abbr -a md-pdf 'pandoc -d md2pdf'
