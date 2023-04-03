function timestamps -d 'Display creation, modified, and last access date of files'
    switch (uname)
        case 'Darwin'
            command stat -f '%N%n%tcreate: %SB%n%tmodify: %Sm%n%taccess: %Sa' -- $argv
        case 'Linux'
            command stat --printf='%n\n\tcreate: %w\n\tmodify: %x\n\taccess: %y\n' -- $argv
    end
end
