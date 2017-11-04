# cookbook filename: func_signals

_signals() {
    local i

    COMPREPLY=( $( compgen -A signal SIG${cur#-} ))

    for (( i=0; i < ${#COMPREPLY[@]}; i++ )); do
       COMPREPLY[i]=$sign${COMPREPLY[i]#SIG}
    done
}
