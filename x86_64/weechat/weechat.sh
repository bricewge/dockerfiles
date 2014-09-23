#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser debian-transmission /usr/bin/transmission-daemon --foreground --config-dir /etc/transmission-daemon/ >> /var/log/transmission.log 2>&1
