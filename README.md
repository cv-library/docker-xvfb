# xvfb under docker

Xvfb is installed from Debian jessie.

## DISPLAY

Display is set to :0 - mount /tmp/.X11-unix as a volume to access it, and
set DISPLAY=:0

## XAUTHORITY

An Xauthority file is created in /tmp/xauth/Xauthority - to access it, mount
/tmp/xauth as a volume.

It is configured to allow access from any host - you just need to set the
XAUTHORITY environment variable to the right path, and ensure your X client
can read the file.
