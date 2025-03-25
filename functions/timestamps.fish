function timestamps -d 'Display creation, modified, and last access date of files'
    command stat --printf='%n\n\tcreate: %w\n\tmodify: %y\n\taccess: %x\n' -- $argv
end
