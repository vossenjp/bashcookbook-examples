#!/usr/bin/env bash
# cookbook filename: run_screen
# run_screen--Wrapper script intended to run from a "profile" file to run
# screen at login time with a friendly menu.

# Sanity check
if [ "$TERM" == "screen" ]; then
    printf "%b" "According to \$TERM = '$TERM' we're *already* using" \
      " screen.\nAborting...\n"
    exit 1
elif [ "$USING_SCREEN" == "YES" ]; then
    printf "%b" "According to \$USING_SCREEN = '$USING_SCREEN' we're"
      " *already* using screen.\nAborting...\n"
    exit 1
fi

# The "$USING_SCREEN" variable is for the rare cases when screen does NOT set
# $TERM=screen. This can happen when 'screen' in not in TERMCAP or friends,
# as is the case on a Solaris 9 box we use but don't control. If we don't
# have some way to tell when we're inside screen, this wrapper goes into an
# ugly and confusing endless loop.

# Seed list with Exit and New options and see what screens are already running;
# The select list is white space delimited, and we only want actual screen
# sessions, so use awk to filter for those, then remove any tabs from
# 'screen -ls' output.
available_screens="Exit New $(screen -ls | awk '/\)$/ { print $1$2$3 }' \
  | tr -d ' ')"

# Print a warning if using run time feedback
run_time_feedback=0
[ "$run_time_feedback" == 1 ] && printf "%b" "
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'screen' Notes:

1) If you reconnect to a screen that is already Attached, you will 'steal'
that existing screen.

2) A session marked 'multi' is in multi-user mode, so be careful about
re-attaching to it.

3) Sessions marked 'unreachable' or 'dead' should be investigated and
removed with the -wipe option if appropriate.\n\n"


# Present a list of choices
PS3='Choose a screen for this session: '
select selection in $available_screens; do
    if [ "$selection" == "Exit" ]; then
        break
    elif [ "$selection" == "New" ]; then
        export USING_SCREEN=YES
        exec screen -c $SETTINGS/screenrc -a \
                    -S $USER.$(date '+%Y-%m-%d_%H:%M:%S%z')
        break
    elif [ "$selection" ]; then
        # Pull out just the part we need using cut
        # We'd rather use a 'here string' [$(cut -d'(' -f1 <<< $selection)]
        # than this echo, but they are only in bash-2.05b+.
        screen_to_use=$(echo $selection | cut -d'(' -f1)
        exec screen -dr $screen_to_use
        break
    else
        printf "%b" "Invalid selection.\n"
    fi
done
