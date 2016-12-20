# cookbook filename: is_process_running

# Can you believe this?!?
case `uname` in
    Linux|AIX) PS_ARGS='-ewwo pid,args'   ;;
    SunOS)     PS_ARGS='-eo pid,args'     ;;
    *BSD)      PS_ARGS='axwwo pid,args'   ;;
    Darwin)    PS_ARGS='Awwo pid,command' ;;
esac

if ps $PS_ARGS | grep -q 'bin/[s]shd'; then
    echo 'sshd is running'
else
    echo 'sshd not running'
fi
