#!/usr/bin/env bash
# cookbook filename: workon
# workon--Work on a file in RCS

# Set a sane/secure path and export it
PATH=/usr/local/bin:/bin:/usr/bin
export PATH

VERSION='$Version: 1.4 $' # JP Vossen
COPYRIGHT='Copyright 2004-2006 JP Vossen (http://www.jpsdomain.org/)'
LICENSE='GNU GENERAL PUBLIC LICENSE'

CAT='/bin/cat'
if [ "$1" = "-h" -o "$1" = "--help" -o -z "$1" ]; then
    ${CAT} <<-EoN
    Usage: $0 {file}

    Work on a file in RCS. Create the RCS subdirectory if necessary.
    Do the initial checkin if necessary, prompting for a message.
    Must be in the same directory as the file to be worked on.
EoN
    exit 0
fi

# Use a pseudo central repository
RCSHOMEDIR='/home/rcs'

# Make sure $VISUAL is set to something
[ "$VISUAL" ] || VISUAL=vi

###################################################################
# Start of Main program

# Make sure RCS Home Dir exists
if [ ! -d $RCSHOMEDIR ]; then
    echo "Creating $RCSHOMEDIR..."
    mkdir -p $RCSHOMEDIR
fi

# Make sure there is no local RCS directory
if [ -d RCS -a ! -L RCS ]; then
    echo "Local 'RCS' already exists--exiting!"
    exit 2
fi

# Make sure the destdir exists
if [ ! -d $RCSHOMEDIR$PWD ]; then
    echo "Creating $RCSHOMEDIR$PWD..."
    mkdir -p $RCSHOMEDIR$PWD
fi

# Make sure the link exists
if [ ! -L RCS ]; then
    echo "Linking RCS --> $RCSHOMEDIR$PWD."
    ln -s $RCSHOMEDIR$PWD RCS
fi

if [ ! -f "RCS/$1,v" ]; then
    # If the file is not ALREADY in RCS add it as v1.0.

    echo 'Adding "Initial Revision/Default" of file to RCS...'

    # Get input
    echo -n 'Describe this file: '
    read logmsg

    # Check in v1.0
    ci -u1.0 -t-"$logmsg" -m'Initial Revision/Default' $1

else
    # If the file is in RCS, work on it.

    # Checkout the file in locked mode for editing
    co -l $1

    # Edit the file locally
    $VISUAL $1

    # Check the file back in, but keep a read-only copy out for use
    ci -u $1
fi
