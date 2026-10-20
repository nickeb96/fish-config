function dvorak
    set -l lowercase_map \
        a a \
        b x \
        c j \
        d e \
        e . \
        f u \
        g i \
        h d \
        i c \
        j h \
        k t \
        l n \
        m m \
        n b \
        o r \
        p l \
        q \\\' \
        r p \
        s o \
        t y \
        u g \
        v k \
        w , \
        x q \
        y f \
        z \; \
        \' - \
        , w \
        . v \
        \; s \
        / z \
        [ / \
        ] = \
        - [ \
        = ]

    for i in (seq 1 2 (count $lowercase_map))
        bind --mode=dvorak $lowercase_map[$i] \
            "commandline -i -- '$lowercase_map[$(math $i + 1)]'"
    end

    set -l uppercase_map \
        A A \
        B X \
        C J \
        D E \
        E \> \
        F U \
        G I \
        H D \
        I C \
        J H \
        K T \
        L N \
        M M \
        N B \
        O R \
        P L \
        Q \" \
        R P \
        S O \
        T Y \
        U G \
        V K \
        W \< \
        X Q \
        Y F \
        Z : \
        \" _ \
        \< W \
        \> V \
        : S \
        ? Z \
        \{ ? \
        \} + \
        _ \{ \
        + \}

    for i in (seq 1 2 (count $uppercase_map))
        bind --mode=dvorak $uppercase_map[$i] \
            "commandline -i -- '$uppercase_map[$(math $i + 1)]'"
    end

    # ctrl/alt mappings

    bind --mode=dvorak ctrl-. edit_command_buffer
    bind --mode=dvorak ctrl-s insert-line-over
    bind --mode=dvorak ctrl-enter 'commandline --insert \\n'
    bind --mode=dvorak ctrl-p 'begin ; end'  # no-op

    bind --mode=dvorak ctrl-i _ctrl_c
    bind --mode=dvorak ctrl-l _ctrl_n
    bind --mode=dvorak ctrl-r _ctrl_p

    bind --mode=dvorak ctrl-y forward-char
    bind --mode=dvorak ctrl-n backward-char
    bind --mode=dvorak ctrl-alt-y forward-word
    bind --mode=dvorak ctrl-alt-n backward-word
    bind --mode=dvorak ctrl-alt-h kill-word
    bind --mode=dvorak ctrl-h _ctrl_d
    bind --mode=dvorak ctrl-alt-j backward-kill-word
    bind --mode=dvorak ctrl-j _autopair_backspace
    bind --mode=dvorak ctrl-a beginning-of-line
    bind --mode=dvorak ctrl-d end-of-line

    bind --mode=dvorak ctrl-\; accept-autosuggestion

    # Regular mappings

    bind --mode=dvorak tab _override_tab
    bind --mode=dvorak enter _override_enter
    bind --mode=dvorak ctrl-m _override_enter
    bind --mode=dvorak ctrl-c _override_enter
    bind --mode=dvorak space _override_space
    bind --mode=dvorak [ _override_slash
    bind --mode=dvorak backspace _autopair_backspace

    bind --mode=dvorak \\ self-insert
    bind --mode=dvorak \| self-insert
    bind --mode=dvorak 1 self-insert
    bind --mode=dvorak 2 self-insert
    bind --mode=dvorak 3 self-insert
    bind --mode=dvorak 4 self-insert
    bind --mode=dvorak 5 self-insert
    bind --mode=dvorak 6 self-insert
    bind --mode=dvorak 7 self-insert
    bind --mode=dvorak 8 self-insert
    bind --mode=dvorak 9 self-insert
    bind --mode=dvorak 0 self-insert
    bind --mode=dvorak ! self-insert
    bind --mode=dvorak @ self-insert
    bind --mode=dvorak \# self-insert
    bind --mode=dvorak \$ self-insert
    bind --mode=dvorak % self-insert
    bind --mode=dvorak ^ self-insert
    bind --mode=dvorak \& self-insert
    bind --mode=dvorak \* self-insert
    bind --mode=dvorak \( self-insert
    bind --mode=dvorak \) self-insert

    # Escape from dvorak

    bind --mode=dvorak escape 'set fish_bind_mode default'
end
