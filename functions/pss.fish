function pss -d 'List processes on the machine'
    switch (uname)
        case 'Darwin'
            command ps -Aco 'user,ruser,pid,ppid,%cpu,%mem,state,comm'
        case 'Linux'
            command ps -Ao 'user,ruser,pid,ppid,%cpu,%mem,state,comm'
    end
end
