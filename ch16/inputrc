# cookbook filename: inputrc

# settings/inputrc: # readline settings
# To re-read (and implement changes to this file) use:
# bind -f $SETTINGS/inputrc

# First, include any systemwide bindings and variable
# assignments from /etc/inputrc
# (fails silently if file doesn't exist)
$include /etc/inputrc

$if Bash
  # Ignore case when doing completion
    set completion-ignore-case on
  # Completed dir names have a slash appended
    set mark-directories on
  # Completed names which are symlinks to dirs have a slash appended
    set mark-symlinked-directories on
  # List ls -F for completion
    set visible-stats on
  # Cycle through ambiguous completions instead of list
    "\C-i": menu-complete
  # Set bell to audible
    set bell-style audible
  # List possible completions instead of ringing bell
    set show-all-if-ambiguous on

  # From the readline documentation at
  # http://tiswww.tis.case.edu/php/chet/readline/readline.html#SEC12
  # Macros that are convenient for shell interaction
  # edit the path
    "\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
  # prepare to type a quoted word -- insert open and closed double quotes
  # and move to just after the open quote
    "\C-x\"": "\"\"\C-b"
  # insert a backslash (testing backslash escapes in sequences and macros)
    "\C-x\\": "\\"
  # Quote the current or previous word
    "\C-xq": "\eb\"\ef\""
  # Add a binding to refresh the line, which is unbound
    "\C-xr": redraw-current-line
  # Edit variable on current line.
    #"\M-\C-v": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
    "\C-xe": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
$endif
