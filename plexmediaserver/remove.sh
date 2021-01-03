#!/bin/sh
# remove.sh: Will remove the installed App from hard drive.

path=$1

# Remove application folder
rm -rf "$path"
