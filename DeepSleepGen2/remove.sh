#!/bin/sh

INSTALL_DIR=$1
MODULES=/usr/local/modules

# tcpdump
rm -f /usr/sbin/tcpdump

# htop
rm -f /usr/bin/htop

rm -f /var/www/
rm -rf $INSTALL_DIR
