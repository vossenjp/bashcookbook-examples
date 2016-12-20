# cookbook filename: prompts

# User name @ short hostname, the date and time and the current working
# directory (CWD):
export PS1='[\u@\h \d \A] \w \$ '

# User name @ long hostname, the date and time in ISO 8601 format and the
# basename of the current working directory (\W):
export PS1='[\u@\H \D{%Y-%m-%d %H:%M:%S%z}] \W \$ '

# User name @ short hostname, bash version, and the current working
# directory (\w):
export PS1='[\u@\h \V \w] \$ '

# New line, user name @ hostname, base PTY, shell level, history number, new
# line, and full working directory name ($PWD).
export PS1='\n[\u@\h \l:$SHLVL:\!]\n$PWD\$ '

# User name @ short hostname, the exit status of the last command and the
# current working directory.
export PS1='[\u@\h $? \w \$ '

# Number of jobs in the background
export PS1='\n[\u@\h jobs:\j]\n$PWD\$ '

# User, short hostname, tty, level, history, jobs, version and full
# working directory name:
export PS1='\n[\u@\h t:\l l:$SHLVL h:\! j:\j v:\V]\n$PWD\$ '

# user@host, T for ptty, L for shell level, C for command number, and the
# date and time in ISO 8601.
export PS1='\n[\u@\h:T\l:L$SHLVL:C\!:\D{%Y-%m-%d_%H:%M:%S_%Z}]\n$PWD\$ '

# User name @ short hostname, and the current working directory in light
# blue:
export PS1='\[\033[1;34m\][\u@\h:\w]\$\[\033[0m\] '

# User name @ short hostname, and the current working directory in both the
# xterm title bar and in the prompt itself.
export PS1='\[\033]0;\u@\h:\w\007\][\u@\h:\w]\$ '

# Both color and xterm updates:
export PS1='\[\033]0;\u@\h:\w\007\]\[\033[1;34m\][\u@\h:\w]\$\[\033[0m\] '
