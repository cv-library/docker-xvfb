#!/bin/sh

set -e

DISPLAY=:0
export XAUTHORITY=/tmp/xauth/Xauthority

# Attempt to clean up after any previous instances which exited uncleanly.
rm -f /tmp/.X0-lock
rm -f $XAUTHORITY
rm -f $XAUTHORITY-*

touch $XAUTHORITY
xauth add $DISPLAY . $(mcookie)

# With two xauths in the same pipeline, this occasionally seemed to lead
# to lockfile issues.
CONTENTS=$(xauth nlist $DISPLAY)
echo $CONTENTS | sed -e 's/^..../ffff/' | xauth nmerge -

exec Xvfb "$DISPLAY" -auth $XAUTHORITY "$@"
