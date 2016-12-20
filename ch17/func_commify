# cookbook filename: func_commify

function commify {
    typeset text=${1}

    typeset bdot=${text%%.*}
    typeset adot=${text#${bdot}}

    typeset i commified
    (( i = ${#bdot} - 1 ))

    while (( i>=3 )) && [[ ${bdot:i-3:1} == [0-9] ]]; do
        commified=",${bdot:i-2:3}${commified}"
        (( i -= 3 ))
    done
    echo "${bdot:0:i+1}${commified}${adot}"
}
