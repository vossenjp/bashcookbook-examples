# cookbook filename: validate_using_case

case $raw_input in
    *.company.com        ) # Probably a local hostname
        ;;
    *.jpg                ) # Probably a JPEG file
        ;;
    *.[jJ][pP][gG]       ) # Probably a JPEG file, case-insensitive
        ;;
    foo | bar            ) # Entered 'foo' or 'bar
        ;;
    [0-9][0-9][0-9]      ) # A 3-digit number
        ;;
    [a-z][a-z][a-z][a-z] ) # A 4-lowercase-char word
        ;;
    *                    ) # None of the above
        ;;
esac
