#!/bin/sh
# stop.sh: Will stop App daemon.

# Stop Plex Media Server
if [ -f "/var/run/plexmediaserver.pid" ]; then
    kill -3 "$(cat /var/run/plexmediaserver.pid)"
    sleep 3
fi

# Force kill any left over Plex processes
if [ "$(pgrep -cf 'plexmediaserver/binaries')" != "0" ]; then
    echo "Force killing leftover processes"
    pkill -ef -9 "plexmediaserver/binaries"
else
    echo "Plex Media Server shutdown cleanly"
fi
