#!/bin/sh
# start.sh: Will start App daemon.

# Set Plex Media Server enviroment variables
export PLEX_DIR="/mnt/HD/HD_a2/Nas_Prog/plexmediaserver"
export PLEX_MEDIA_SERVER_PIDFILE="/var/run/plexmediaserver.pid"
export LD_LIBRARY_PATH="$PLEX_DIR/binaries/lib"
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/mnt/HD/HD_a2/Nas_Prog/plex_conf"
export PLEX_MEDIA_SERVER_DEFAULT_PREFERENCES="HardwareAcceleratedCodecs=true&TranscoderCanOnlyRemuxVideo=true"
export TMPDIR="$PLEX_DIR/tmp_transcoding"
export PLEX_BROWSER_ROOT="/shares"
export PLEX_BROWSER_NO_HOME_DIR=1
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Set max stack size
ulimit -s 3000

# Set identification variables
export PLEX_MEDIA_SERVER_INFO_VENDOR="Western Digital"
export PLEX_MEDIA_SERVER_INFO_DEVICE="$(grep modelName /etc/system.conf | cut -d \" -f2)"
export PLEX_MEDIA_SERVER_INFO_MODEL="$(uname -m)"
export PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION="$(cat /etc/version)"

# Start Plex Media Server
$PLEX_DIR/binaries/Plex\ Media\ Server &
