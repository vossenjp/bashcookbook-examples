This directory contains sample configuration files.
See chapter 16 for details.


/etc/profile
Global login environment file for Bourne and similar login shells.  We
recommend you leave this alone unless you are the system administrator
and know what you are doing.

/etc/bashrc (Red Hat)
/etc/bash.bashrc (Debian)
Global environment file for interactive bash sub-shells.  We recommend
you leave this alone unless you are the system administrator and know
what you are doing.

/etc/bash_completion
If this exists, it's almost certainly the configuration file for Ian
Macdonald's programmable completion library (see [Recipe #Improving
Programmable Completion]).  We recommend looking into it, it's
pretty cool.

/etc/inputrc
Global GNU Readline configuration.  We recommend tweaking this as desired
for the entire system (if you are the administrator), or tweaking
~/.inputrc for just you ([Receipe #Getting Started with a Custom
Configuration]).  This is not executed or sourced but read in via
Readline and $INPUTRC, and $include (or bind -f) and note that it may
contain include statements to other Readline files.


~/.bashrc
Personal environment file for interactive bash sub-shells.  We recommend
that you place your aliases, functions and fancy prompts here.

~/.bash_profile
Personal profile for bash login shells.  We recommend that you make
sure this  sources ~/.bashrc, then ignore it.

~/.bash_login
Personal profile file for Bourne login shells; only used by bash if
~/.bash_profile is not present.  We recommend you ignore this.

~/.profile
Personal profile file for Bourne login shells; only used by bash if
~/.bash_profile and ~/.bash_login are not present.  We recommend you
ignore this unless you also use other shells that use it.

~/.bash_logout
Executed when you logout.  We recommend you place any cleanup routines,
(e.g., [Recipe #Clear the Screen when you Log Out]) here.  This is only
executed on a clean logout (i.e., not if your session dies due to a
dropped WAN link).

~/.inputrc
Personal customizations for GNU Readline.  We recommend tweaking this
as desired ([Receipe #Getting Started with a Custom Configuration]).
This is not executed or sourced but read in via Readline and $INPUTRC,
and $include (or bind -f) and note that it may contain include
statements to other Readline files.
