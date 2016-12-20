# cookbook filename: func_choice

function choice {
    # Let the user make a choice about something and return a standardized
    # answer. How the default is handled and what happens next is up to
    # the if/then after the choice in main

    local answer
    printf "%b" "\a"        # Ring the bell
    read -p "$*" answer
    case "$answer" in
        [yY1] ) choice='y';;
        [nN0] ) choice='n';;
        *     ) choice="$answer";;
    esac
} # end of function choice
