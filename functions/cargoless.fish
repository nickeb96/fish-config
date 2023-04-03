function cargoless --wrap=cargo
    switch $argv[1]
        case 'c' 'check' 'b' 'build'
            command cargo $argv &| less -RXF
        case '*'
            command cargo $argv
    end
end
