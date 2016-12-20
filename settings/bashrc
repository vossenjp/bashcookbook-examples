# cookbook filename: bashrc

# settings/bash_profile: subshell environment settings
# To re-read (and implement changes to this file) use:
# source $SETTINGS/bashrc

# Fail-safe. This should be set when we're called, but if not, the
# "not found" error messages should be pretty clear.
# Use leading ':' to prevent this from being run as a program after
# it is expanded.
: ${SETTINGS:='SETTINGS_variable_not_set'}


# DEBUGGING only--will break scp, rsync
# echo "Sourcing $SETTINGS/bash_profile..."
# export PS4='+xtrace $LINENO: '
# set -x

# Debugging/logging--will not break scp, rsync
#case "$-" in
#    *i*) echo "$(date '+%Y-%m-%d_%H:%M:%S_%Z') Interactive" \
#              "$SETTINGS/bashrc ssh=$SSH_CONNECTION" >> ~/rc.log ;;
#    *  ) echo "$(date '+%Y-%m-%d_%H:%M:%S_%Z') Non-interactive" \
#              "$SETTINGS/bashrc ssh=$SSH_CONNECTION" >> ~/rc.log ;;
#esac


# In theory this is also sourced from /etc/bashrc (/etc/bash.bashrc )
# or ~/.bashrc to apply all these settings to login shells too. In practice
# if these settings only work sometimes (like in subshells), verify that.


# Set some more useful prompts
# Interactive command line prompt.
# ONLY set one of these if we really are interactive, since lots of people
# (even use sometimes) test to see if a shell is interactive using
# something like: if [ "$PS1" ]; then
case "$-" in
    *i*)
        #export PS1='\n[\u@\h t:\l l:$SHLVL h:\! j:\j v:\V]\n$PWD\$ '
        #export PS1='\n[\u@\h:T\l:L$SHLVL:C\!:\D{%Y-%m-%d_%H:%M:%S_%Z}]\n$PWD\$ '
        export PS1='\n[\u@\h:T\l:L$SHLVL:C\!:J\j:\D{%Y-%m-%d_%H:%M:%S_%Z}]\n$PWD\$ '
        #export PS2='> '                      # Secondary (i.e. continued) prompt
        #export PS3='Please make a choice: '  # Select prompt
        export PS4='+xtrace $LINENO: '        # xtrace (debug) prompt
    ;;
esac

# Make sure custom inputrc is handled, if we can find it, note different
# names. Also note different order, since for this one we probably want
# our custom settings to over-ride the system file, if present.
for file in $SETTINGS/inputrc ~/.inputrc /etc/inputrc; do
    [ -r "$file" ] && export INPUTRC="$file" && break # Use first found
done

# No core files by default
# See also /etc/security/limits.conf on many Linux systems.
ulimit -S -c 0 > /dev/null 2>&1

# Don't let CTRL-D exit the shell
set -o ignoreeof

# Set various aspects of the bash history
export HISTSIZE=5000          # Num. of commands in history stack in memory
export HISTFILESIZE=5000      # Num. of commands in history FILE
export HISTCONTROL=ignoreboth # bash < 3, omit dups & lines starting with space
export HISTIGNORE='&:[ ]*'    # bash >= 3, omit dups & lines starting with space
#export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%Z=' # bash >= 3, time-stamp hist file
shopt -s histappend           # Append rather than overwrite history on exit
shopt -q -s cdspell           # Auto-fix minor typos in interactive use of 'cd'
shopt -q -s checkwinsize      # Update the values of LINES and COLUMNS
shopt -q -s cmdhist           # Make multi-line commands 1 line in history
set -o notify   # (or set -b) # Immediate notification of bckgrnd job termintn.

# Other bash settings
export LC_COLLATE='C'         # Set traditional C sort order (e.g. UC first)
export HOSTFILE='/etc/hosts'  # Use /etc/hosts for host name completion
export CDPATH='~/:.:..:../..' # Similar to $PATH, but for use by 'cd'
# Note that the '.' in $CDPATH is needed so that cd will work under POSIX mode
# but this will also cause cd to echo the new directory to STDOUT!

# Import bash completion settings, if they exist in the default location.
# This can take a second or two on a slow system, so you may not always
# want to do it, even if it does exist (which it doesn't by default on many
# systems, e.g. Red Hat).
# [ -r /etc/bash_completion ] && source /etc/bash_completion


# Use a lesspipe filter, if we can find it. This sets the $LESSOPEN variable
# Globally replace the $PATH ':' delimiter with space for use in a list
for path in $SETTINGS /opt/bin ~/ ${PATH//:/ }; do
    # Use first one found of 'lesspipe.sh' (preferred) or 'lesspipe' (Debian)
    [ -x "$path/lesspipe.sh" ] && eval $("$path/lesspipe.sh") && break
    [ -x "$path/lesspipe" ]    && eval $("$path/lesspipe")    && break
done

# Set other less & editor prefs (overkill)
export LESS="--LONG-PROMPT --LINE-NUMBERS --QUIET"
export VISUAL='vi' # Set a default that should always work
# We'd rather use 'type -P' here, but that was added in bash-2.05b and we use
# systems we don't control with versions older than that. We can't easily
# use 'which' since that produces output whether the file is found or not.
for path in ${PATH//:/ }; do
    # Overwrite VISUAL if we can find nano
    [ -x "$path/nano" ] \
      && export VISUAL='nano --smooth --const --nowrap --suspend' && break
done
# See above notes re: nano for why we're using this for loop
for path in ${PATH//:/ }; do
    # Alias vi to vim in binary mode if we can
    [ -x "$path/vim" ] && alias vi='vim -b' && break
done
export EDITOR="$VISUAL"      # Yet Another Possibility
export SVN_EDITOR="$VISUAL"  # Subversion
alias edit=$VISUAL           # Provide a command to use on all systems

# Set ls options and aliases
# Note all the colorizing may or may not work depending on your terminal
# emulation and settings, esp. ANSI color. But it shouldn't hurt to have.
# See above notes re: nano for why we're using this for loop
for path in ${PATH//:/ }; do
    [ -r "$path/dircolors" ] && eval "$(dircolors)" \
      && LS_OPTIONS='--color=auto' && break
done
export LS_OPTIONS="$LS_OPTIONS -F -h"
# Using dircolors may cause csh scripts to fail with an
# "Unknown colorls variable `do'." error. The culprit is the ":do=01;35:"
# part in the LS_COLORS environment variable. For a possible solution see
# http://forums.macosxhints.com/showthread.php?t=7287
# eval "$(dircolors)"
alias ls="ls $LS_OPTIONS"
alias ll="ls $LS_OPTIONS -l"
alias ll.="ls $LS_OPTIONS -ld" # Usage: ll. ~/.*
alias la="ls $LS_OPTIONS -la"

# Useful aliases
alias bot='cd $(dirname $(find . | tail -n 1))'
alias clr='cd ~/ && clear'   # Clear and return $HOME
alias cls='clear'            # DOS-ish for clear
alias copy='cp'              # DOS-ish for cp
#alias cp='cp -i'            # Annoying Red Hat default from /root/.bashrc
alias cvsst='cvs -qn update' # Hack to get concise CVS status (like svn st)
alias del='rm'               # DOS-ish for rm
alias diff='\diff -u'        # Make unified diffs the default
alias jdiff="\diff --side-by-side --ignore-case --ignore-blank-lines\
--ignore-all-space --suppress-common-lines" # Useful GNU diff command
alias dir='ls'               # DOS-ish for ls
alias hr='history -a && history -n' # Append current, then re-read history
alias ipconfig='ifconfig'    # Windows-ish for ifconfig
alias md='mkdir'             # DOS-ish for mkdir
alias move='mv'              # DOS-ish for mv
#alias mv='mv -i'             # Annoying Red Hat default from /root/.bashrc
alias ntsysv='rcconf'        # Debian rcconf is pretty close to Red Hat ntsysv
alias pathping='mtr'         # mtr - a network diagnostic tool
alias r='fc -s'              # Recall and execute 'command' starting with...
alias rd='rmdir'             # DOS-ish for rmdir alias ren='mv' # DOS-ish for mv/rename
#alias rm='rm -i'            # Annoying Red Hat default from /root/.bashrc
alias svnpropfix='svn propset svn:keywords "Id URL"'
alias tracert='traceroute'   # DOS-ish for traceroute
alias vzip='unzip -lvM'      # View contents of ZIP file
alias wgetdir="wget --no-verbose --recursive --no-parent --no-directories \
--level=1"                   # Grab a whole directory using wget
alias zonex='host -l'        # Extract (dump) DNS zone

# if the script exists and is executable, create an alias to get
# web server headers
for path in ${PATH//:/ }; do
    [ -x "$path/lwp-request" ] && alias httpdinfo='lwp-request -eUd' && break
done

# Try to use kbdrate to make the keyboard go faster, but don't complain if
# it's not there. Easier/faster to throw out error if it's not there...
kbdrate -r 30.0 -d 250 &> /dev/null


# Useful functions

# mkdir newdir then cd into it
# usage: mcd (<mode>) <dir>
function mcd {
    local newdir='_mcd_command_failed_'
    if [ -d "$1" ]; then         # Dir exists, mention that...
        echo $1 exists...
    else
        if [ -n "$2" ]; then     # We've specified a mode
            command mkdir -p -m $1 "$2" && newdir="$2"
        else                     # Plain old mkdir
            command mkdir -p "$1" && newdir="$1"
        fi
    fi
    builtin cd "$newdir"         # No matter what, cd into it
} # end of mcd


# Trivial command line calculator
function calc {
    # INTEGER ONLY! --> echo The answer is: $(( $* ))
    # Floating point
    awk "BEGIN {print \"The answer is: \" $* }";
} # end of calc


# Allow use of 'cd ...' to cd up 2 levels, 'cd ....' up 3, etc. (like 4NT/4DOS)
# Usage: cd ..., etc.
function cd {

    local option= length= count= cdpath= i= # Local scope and start clean

    # If we have a -L or -P sym link option, save then remove it
    if [ "$1" = "-P" -o "$1" = "-L" ]; then
        option="$1"
        shift
    fi

    # Are we using the special syntax? Make sure $1 isn't empty, then
    # match the first 3 characters of $1 to see if they are '...' then
    # make sure there isn't a slash by trying a substitution; if it fails,
    # there's no slash. Both of these string routines require Bash 2.0+
    if [ -n "$1" -a "${1:0:3}" = '...' -a "$1" = "${1%/*}" ]; then
        # We are using special syntax
        length=${#1}  # Assume that $1 has nothing but dots and count them
        count=2       # 'cd ..' still means up one level, so ignore first two

        # While we haven't run out of dots, keep cd'ing up 1 level
        for ((i=$count;i<=$length;i++)); do
            cdpath="${cdpath}../" # Build the cd path
        done

        # Actually do the cd
        builtin cd $option "$cdpath"
    elif [ -n "$1" ]; then
        # We are NOT using special syntax; just plain old cd by itself
        builtin cd $option "$*"
    else
        # We are NOT using special syntax; plain old cd by itself to home dir
        builtin cd $option
    fi
} # end of cd


# Do site or host specific things here
case $HOSTNAME in
    *.company.com     ) # source $SETTINGS/company.com
                      ;;
    host1.*           ) # host1 stuff
                      ;;
    host2.company.com ) # source .bashrc.host2
                      ;;
    drake.*           ) # echo DRAKE in bashrc.jp!
                        export TAPE=/dev/tape
                      ;;
esac
