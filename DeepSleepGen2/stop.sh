#!/bin/sh

# If Plex is installed, move Logs and Cache to ram
if [ -d "/mnt/HD/HD_a2/Nas_Prog/plex_conf" ]; then

    # Restore the Logs folder
    rm -rf "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Logs"

    # Restore the cache folder
    rm -rf "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Cache"

    # enable tuner service
    mv "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex Tuner Service Disabled" "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex Tuner Service"

    # enable dlna server
    mv "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex DLNA Server Disabled" "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex DLNA Server"
fi

# Restore original crontab
/usr/bin/crontab /mnt/HD/HD_a2/Nas_Prog/DeepSleepGen2/crontab.org &

# Start WD Notifier
/etc/init.d/wdnotifierd start 2>&1 >/dev/null &

# Restart indexer
/etc/init.d/restsdk-serverd start 2>&1 >/dev/null &