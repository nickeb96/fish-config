status is-interactive || exit

if string match -q 'alacritty*' -- $TERM
    set -g fish_term24bit 1
end

# directory             82a4e2
# soft link             96d9d9
# named pipe            f77b63
# socket                f77b63
# door                  f77b63
# block device          f5c946 + bold
# character device      f5c946
# orphan                ec8282
# missing link target   999999
# setuid                b0d46d + reverse
# setgid                b0d46d + reverse
# capability            bold
# sticky other writable 82a4e2 + reverse
# other writable        82a4e2
# sticky                82a4e2 + reverse
# exec                  b0d46d
# archive               e2d182
# audio                 cd76ee
# video                 ea79e0
# image                 f17bbb

set -gx LSCOLORS 'exgxbxdxcxegedabagacad'

set -l dircolors_contents 'rs=0:di=38;2;130;164;226:ln=38;2;150;217;217:pi=38;2;247;123;99
so=38;2;247;123;99:do=38;2;247;123;99:bd=1;38;2;245;201;70:cd=38;2;245;201;70
or=38;2;236;130;130:mi=38;2;153;153;153:su=7;1;38;2;176;212;109:sg=7;38;2;176;212;109
ca=1:tw=7;38;2;130;164;226:ow=38;2;130;164;226:st=7;38;2;130;164;226:ex=38;2;176;212;109
*.a=38;2;226;209;130:*.tar=38;2;226;209;130:*.tgz=38;2;226;209;130:*.arc=38;2;226;209;130
*.arj=38;2;226;209;130:*.taz=38;2;226;209;130:*.lha=38;2;226;209;130:*.lz4=38;2;226;209;130
*.lzh=38;2;226;209;130:*.lzma=38;2;226;209;130:*.tlz=38;2;226;209;130:*.txz=38;2;226;209;130
*.tzo=38;2;226;209;130:*.t7z=38;2;226;209;130:*.zip=38;2;226;209;130:*.z=38;2;226;209;130
*.dz=38;2;226;209;130:*.gz=38;2;226;209;130:*.lrz=38;2;226;209;130:*.lz=38;2;226;209;130
*.lzo=38;2;226;209;130:*.xz=38;2;226;209;130:*.zst=38;2;226;209;130:*.tzst=38;2;226;209;130
*.bz2=38;2;226;209;130:*.bz=38;2;226;209;130:*.tbz=38;2;226;209;130:*.tbz2=38;2;226;209;130
*.tz=38;2;226;209;130:*.deb=38;2;226;209;130:*.rpm=38;2;226;209;130:*.jar=38;2;226;209;130
*.war=38;2;226;209;130:*.ear=38;2;226;209;130:*.sar=38;2;226;209;130:*.rar=38;2;226;209;130
*.alz=38;2;226;209;130:*.ace=38;2;226;209;130:*.zoo=38;2;226;209;130:*.cpio=38;2;226;209;130
*.7z=38;2;226;209;130:*.rz=38;2;226;209;130:*.cab=38;2;226;209;130:*.wim=38;2;226;209;130
*.swm=38;2;226;209;130:*.dwm=38;2;226;209;130:*.esd=38;2;226;209;130:*.aac=38;2;205;118;238
*.au=38;2;205;118;238:*.flac=38;2;205;118;238:*.mid=38;2;205;118;238:*.midi=38;2;205;118;238
*.mka=38;2;205;118;238:*.mp3=38;2;205;118;238:*.mpc=38;2;205;118;238:*.ogg=38;2;205;118;238
*.opus=38;2;205;118;238:*.ra=38;2;205;118;238:*.wav=38;2;205;118;238:*.m4a=38;2;205;118;238
*.axa=38;2;205;118;238:*.oga=38;2;205;118;238:*.spx=38;2;205;118;238:*.xspf=38;2;205;118;238
*.mov=38;2;234;121;224:*.MOV=38;2;234;121;224:*.mpg=38;2;234;121;224:*.mpeg=38;2;234;121;224
*.m2v=38;2;234;121;224:*.mkv=38;2;234;121;224:*.ogm=38;2;234;121;224:*.mp4=38;2;234;121;224
*.m4v=38;2;234;121;224:*.mp4v=38;2;234;121;224:*.vob=38;2;234;121;224:*.qt=38;2;234;121;224
*.nuv=38;2;234;121;224:*.wmv=38;2;234;121;224:*.asf=38;2;234;121;224:*.rm=38;2;234;121;224
*.rmvb=38;2;234;121;224:*.flc=38;2;234;121;224:*.avi=38;2;234;121;224:*.fli=38;2;234;121;224
*.flv=38;2;234;121;224:*.gl=38;2;234;121;224:*.m2ts=38;2;234;121;224:*.divx=38;2;234;121;224
*.webm=38;2;234;121;224:*.axv=38;2;234;121;224:*.anx=38;2;234;121;224:*.ogv=38;2;234;121;224
*.ogx=38;2;234;121;224:*.jpg=38;2;241;123;187:*.JPG=38;2;241;123;187:*.jpeg=38;2;241;123;187
*.gif=38;2;241;123;187:*.bmp=38;2;241;123;187:*.pbm=38;2;241;123;187:*.pgm=38;2;241;123;187
*.ppm=38;2;241;123;187:*.tga=38;2;241;123;187:*.xbm=38;2;241;123;187:*.xpm=38;2;241;123;187
*.tif=38;2;241;123;187:*.tiff=38;2;241;123;187:*.png=38;2;241;123;187:*.PNG=38;2;241;123;187
*.svg=38;2;241;123;187:*.svgz=38;2;241;123;187:*.mng=38;2;241;123;187:*.pcx=38;2;241;123;187
*.dl=38;2;241;123;187:*.xcf=38;2;241;123;187:*.xwd=38;2;241;123;187:*.yuv=38;2;241;123;187
*.cgm=38;2;241;123;187:*.emf=38;2;241;123;187:*.eps=38;2;241;123;187:*.CR2=38;2;241;123;187
*.ico=38;2;241;123;187:*.nef=38;2;241;123;187:*.NEF=38;2;241;123;187:*.webp=38;2;241;123;187'

set -gx LS_COLORS (echo $dircolors_contents | string join ':')

set -l exacolors_contents 'reset:di=38;2;130;164;226:ex=38;2;176;212;109:pi=38;2;247;123;99
so=38;2;247;123;99:ln=38;2;150;217;217:or=38;2;236;130;130:bd=1;38;2;245;201;70
cd=38;2;245;201;70:uu=38;2;153;153;153:gu=38;2;153;153;153:un=38;2;246;165;125
gn=38;2;246;165;125:sn=0:sb=0:lc=0:lm=1:xx=0:da=0:lp=38;2;130;164;226:bO=38;2;153;153;153
ur=0:uw=0:ux=0:ue=0:su=1;7;38;2;231;130;147:sf=1;7;38;2;231;130;147:gr=0:gw=0:gx=0:tr=0
tw=0:tx=0:*.a=38;2;226;209;130:*.tar=38;2;226;209;130:*.tgz=38;2;226;209;130
*.arc=38;2;226;209;130:*.arj=38;2;226;209;130:*.taz=38;2;226;209;130:*.lha=38;2;226;209;130
*.lz4=38;2;226;209;130:*.lzh=38;2;226;209;130:*.lzma=38;2;226;209;130:*.tlz=38;2;226;209;130
*.txz=38;2;226;209;130:*.tzo=38;2;226;209;130:*.t7z=38;2;226;209;130:*.zip=38;2;226;209;130
*.z=38;2;226;209;130:*.dz=38;2;226;209;130:*.gz=38;2;226;209;130:*.lrz=38;2;226;209;130
*.lz=38;2;226;209;130:*.lzo=38;2;226;209;130:*.xz=38;2;226;209;130:*.zst=38;2;226;209;130
*.tzst=38;2;226;209;130:*.bz2=38;2;226;209;130:*.bz=38;2;226;209;130:*.tbz=38;2;226;209;130
*.tbz2=38;2;226;209;130:*.tz=38;2;226;209;130:*.deb=38;2;226;209;130:*.rpm=38;2;226;209;130
*.jar=38;2;226;209;130:*.war=38;2;226;209;130:*.ear=38;2;226;209;130:*.sar=38;2;226;209;130
*.rar=38;2;226;209;130:*.alz=38;2;226;209;130:*.ace=38;2;226;209;130:*.zoo=38;2;226;209;130
*.cpio=38;2;226;209;130:*.7z=38;2;226;209;130:*.rz=38;2;226;209;130:*.cab=38;2;226;209;130
*.wim=38;2;226;209;130:*.swm=38;2;226;209;130:*.dwm=38;2;226;209;130:*.esd=38;2;226;209;130
*.aac=38;2;205;118;238:*.au=38;2;205;118;238:*.flac=38;2;205;118;238:*.mid=38;2;205;118;238
*.midi=38;2;205;118;238:*.mka=38;2;205;118;238:*.mp3=38;2;205;118;238:*.mpc=38;2;205;118;238
*.ogg=38;2;205;118;238:*.opus=38;2;205;118;238:*.ra=38;2;205;118;238:*.wav=38;2;205;118;238
*.m4a=38;2;205;118;238:*.axa=38;2;205;118;238:*.oga=38;2;205;118;238:*.spx=38;2;205;118;238
*.xspf=38;2;205;118;238:*.mov=38;2;234;121;224:*.MOV=38;2;234;121;224:*.mpg=38;2;234;121;224
*.mpeg=38;2;234;121;224:*.m2v=38;2;234;121;224:*.mkv=38;2;234;121;224:*.ogm=38;2;234;121;224
*.mp4=38;2;234;121;224:*.m4v=38;2;234;121;224:*.mp4v=38;2;234;121;224:*.vob=38;2;234;121;224
*.qt=38;2;234;121;224:*.nuv=38;2;234;121;224:*.wmv=38;2;234;121;224:*.asf=38;2;234;121;224
*.rm=38;2;234;121;224:*.rmvb=38;2;234;121;224:*.flc=38;2;234;121;224:*.avi=38;2;234;121;224
*.fli=38;2;234;121;224:*.flv=38;2;234;121;224:*.gl=38;2;234;121;224:*.m2ts=38;2;234;121;224
*.divx=38;2;234;121;224:*.webm=38;2;234;121;224:*.axv=38;2;234;121;224:*.anx=38;2;234;121;224
*.ogv=38;2;234;121;224:*.ogx=38;2;234;121;224:*.jpg=38;2;241;123;187:*.JPG=38;2;241;123;187
*.jpeg=38;2;241;123;187:*.gif=38;2;241;123;187:*.bmp=38;2;241;123;187:*.pbm=38;2;241;123;187
*.pgm=38;2;241;123;187:*.ppm=38;2;241;123;187:*.tga=38;2;241;123;187:*.xbm=38;2;241;123;187
*.xpm=38;2;241;123;187:*.tif=38;2;241;123;187:*.tiff=38;2;241;123;187:*.png=38;2;241;123;187
*.PNG=38;2;241;123;187:*.svg=38;2;241;123;187:*.svgz=38;2;241;123;187:*.mng=38;2;241;123;187
*.pcx=38;2;241;123;187:*.dl=38;2;241;123;187:*.xcf=38;2;241;123;187:*.xwd=38;2;241;123;187
*.yuv=38;2;241;123;187:*.cgm=38;2;241;123;187:*.emf=38;2;241;123;187:*.eps=38;2;241;123;187
*.CR2=38;2;241;123;187:*.ico=38;2;241;123;187:*.nef=38;2;241;123;187:*.NEF=38;2;241;123;187
*.webp=38;2;241;123;187'

set -gx EXA_COLORS (echo $exacolors_contents | string join ':')

