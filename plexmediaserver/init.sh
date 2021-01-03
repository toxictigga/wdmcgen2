#!/bin/sh
# init.sh: Will create necessary symbolic links of installed App before being
# executed. (We suggest creating the symbolic link to /usr/bin or /usr/sbin.)
# If necessary, restore those configuration files that being backed up through
# preinst.sh back to App installed folder.

path=$1

# If there is no previous 'plex_conf' folder then create one
if [ ! -d "/mnt/HD/HD_a2/Nas_Prog/plex_conf" ]; then
  mkdir -p "/mnt/HD/HD_a2/Nas_Prog/plex_conf"
fi

# If there is no previous 'tmp_transcoding' folder then create one
if [ ! -d "$path/tmp_transcoding" ]; then
  mkdir -p "$path/tmp_transcoding"
fi

# create links
if [ ! -f "/var/www/plexmediaserver" ]; then
  ln -s "$path" "/var/www/plexmediaserver"
fi
