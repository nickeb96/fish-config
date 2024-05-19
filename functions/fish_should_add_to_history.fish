function fish_should_add_to_history
    switch $argv[1]
        case vi
            return 1
        case '*'
            return 0
    end
end
