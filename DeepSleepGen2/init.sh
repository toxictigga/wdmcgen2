#!/bin/sh

INSTALL_DIR=$1

# tcpdump
ln -sf $INSTALL_DIR/files/tcpdump /usr/sbin/tcpdump

# htop
ln -sf $INSTALL_DIR/files/htop /usr/bin/htop

# web info
ln -sf $INSTALL_DIR/web /var/www/DeepSleepGen2

# enable few busybox commands
ln -sf /bin/busybox /bin/which

# save the original crontab here so that we can restore when the app is deleted or stopped
/usr/bin/crontab -l > /mnt/HD/HD_a2/Nas_Prog/DeepSleepGen2/crontab.org
