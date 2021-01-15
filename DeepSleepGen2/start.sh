#!/bin/sh

# This way you can run htop without having to export this everytime
# Make sure to run bash before running htop
echo "export TERM=xterm" > /etc/profile

# If Plex is installed, move Logs and Cache to ram
if [ -d "/mnt/HD/HD_a2/Nas_Prog/plex_conf" ]; then
    # Create the Logs and directory in ram
    rm -rf /tmp/plex
    mkdir /tmp/plex
    mkdir /tmp/plex/Cache
    mkdir /tmp/plex/Logs

    # Let's remove the Logs folder
    rm -rf "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Logs"
    ln -s /tmp/plex/Logs "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Logs"

    # Let's move the cache folder to ram
    rm -rf "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Cache"
    ln -s /tmp/plex/Cache "/mnt/HD/HD_a2/Nas_Prog/plex_conf/Plex Media Server/Cache"

    # disable tuner service
    mv "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex Tuner Service" "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex Tuner Service Disabled" 

    # disable dlna server
    mv "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex DLNA Server" "/mnt/HD/HD_a2/Nas_Prog/plexmediaserver/binaries/Plex DLNA Server Disabled" 
fi

# Update crontab with the new crontab
/usr/bin/crontab /mnt/HD/HD_a2/Nas_Prog/DeepSleepGen2/crontab.new &
/usr/sbin/crond restart &

# Kill uPNP. Potential security risk and probably keeps the drive up
killall upnp_nas_device 2>&1 >/dev/null &

# Kill WD Notifier. We are not monitoring anything. 
/etc/init.d/wdnotifierd stop 2>&1 >/dev/null &

# restsdk-server. I don't want WD mycloud to index nothing periodically
# Stop DeepSleep Gen 2 mod to restart indexing service
/etc/init.d/restsdk-serverd stop 2>&1 >/dev/null &

# Kill atop and related services
/etc/init.d/atop stop 2>&1 >/dev/null &