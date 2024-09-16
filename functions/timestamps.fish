function timestamps -d 'Display creation, modified, and last access date of files'
    command stat --printf='%n\n\tcreate: %w\n\tmodify: %x\n\taccess: %y\n' -- $argv
end
