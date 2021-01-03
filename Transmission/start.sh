#!/bin/sh

[ -f /tmp/debug_apkg ] && echo "APKG_DEBUG: $0 $@" >> /tmp/debug_apkg

path=$1
echo "Install Path is $path"

WEBPATH="/var/www/Transmission"

counter=10
while [ ! -d "$WEBPATH" -a "$counter" -ne 0 ]
do
	echo waiting some more for pre_inst.sh to finish, count "$counter" > /dev/console
	sleep 1
	counter=`expr $counter - 1`
done

export TRANSMISSION_WEB_HOME=$path/web_transmission
PID_FILE=/var/run/addon_transmission.pid

transmission-daemon-addon -M --config-dir $path/config --pid-file $PID_FILE

sleep 3

transmission-remote-addon localhost:9091 --torrent all --start
