#!/usr/bin/env bash
# cookbook filename: command_substitution

REMOTE_HOST='host.example.com'  # Required
REMOTE_FILE='/etc/passwd'       # Required
SSH_USER='user@'                # Optional, set to '' to not use
#SSH_ID='-i ~/.ssh/foo.id'       # Optional, set to '' to not use
SSH_ID=''

result=$(
    ssh $SSH_ID $SSH_USER$REMOTE_HOST \
      "[ -r $REMOTE_FILE ] && echo 1 || echo 0"
) || { echo "SSH command failed!" >&2; exit 1; }

if [ $result = 1 ]; then
    echo "$REMOTE_FILE present on $REMOTE_HOST"
else
    echo "$REMOTE_FILE not present on $REMOTE_HOST"
fi
