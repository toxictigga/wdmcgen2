#!/bin/bash

# Note for x64 debian or ubuntu:
# dpkg --add-architecture i386
# apt update
# apt install libxml2:i386

# Remove all the previously generated binaries
rm -rf *.bin*

# Remove all temporary files
find . -name ".DS_Store" -delete

# Plex Media Server
DATE="`date +"%m%d%Y"`"
cd 'plexmediaserver'
../mkpkg32 -E -s -m WDMyCloud
cd ../
find -maxdepth 1 -name "*.bin*" -exec rename 's/\('$DATE'\)//g' {} \;

# Transmission
DATE="`date +"%m%d%Y"`"
cd 'Transmission'
../mkpkg32 -E -s -m WDMyCloud
cd ../
find -maxdepth 1 -name "*.bin*" -exec rename 's/\('$DATE'\)//g' {} \;

# DeepSleepGen2
DATE="`date +"%m%d%Y"`"
cd 'DeepSleepGen2'
../mkpkg32 -E -s -m WDMyCloud
cd ../
find -maxdepth 1 -name "*.bin*" -exec rename 's/\('$DATE'\)//g' {} \;

