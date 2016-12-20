# cookbook filename: func_kill

_kill() {
    local cur
        local sign

    COMPREPLY=( )
    cur=${COMP_WORDS[COMP_CWORD]}

    if (($COMP_CWORD == 2)) && [[ ${COMP_WORDS[1]} == -n ]]; then
       # return list of available signals
           _signals
    elif (($COMP_CWORD == 1 )) && [[ "$cur" == -* ]]; then
       # return list of available signals
       sign="-"
       _signals
        else
       # return list of available PIDs
       COMPREPLY=( $( compgen -W '$( command ps axo pid | sed 1d )' $cur ) )
    fi
}
