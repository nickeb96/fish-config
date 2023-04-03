function prompt_pwd
    set -q fish_prompt_pwd_dir_length
    or set -l fish_prompt_pwd_dir_length 4
    set -q fish_prompt_pwd_use_ellipsis
    or set -l fish_prompt_pwd_use_ellipsis yes
    set -q fish_prompt_pwd_show_home
    or set -l fish_prompt_pwd_show_home yes

    set -l tmp $PWD
    if [ $fish_prompt_pwd_show_home = yes ]
        set tmp (string replace -r '^'"$HOME"'($|/)' '~$1' $PWD)
    else
        if [ $tmp = $HOME ]
            set tmp '~'
        else
            set tmp (string replace -r '^'"$HOME"'/(.*)' '$1' $PWD)
        end
    end

    if [ $fish_prompt_pwd_use_ellipsis = yes ]
        switch $fish_prompt_pwd_dir_length
            case 0
                echo $tmp
            case 1
                string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
            case '*'
                set -l real_dir_length (math "$fish_prompt_pwd_dir_length - 1")
                set -l re_expr '(\.?[^/]{'"$real_dir_length"'}?)[^/]{2,}/'
                string replace -ar "$re_expr" '$1…/' $tmp
        end
    else
        switch $fish_prompt_pwd_dir_length
            case 0
                echo $tmp
            case '*'
                string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
        end
    end
end
