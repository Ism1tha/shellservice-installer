#!/bin/bash

# AIA NFS Backup Script
# This script will backup the AIA NFS Service to a network share.

# Copy current user home to backup with timestamp name (e.g. /home/username/alumne-2020-01-01-00-00-00)

last_user=$(last -1 | awk 'NR==1{ print $1 }')
current_date=$(date +%Y-%m-%d-%H-%M-%S)

if [ ! -d "/mnt/nfs/$last_user" ]; then
  mkdir /mnt/nfs/$last_user
fi

mkdir /mnt/nfs/$last_user/$current_date
cp -r /home/$last_user/fitxers/* /mnt/nfs/$last_user/$current_date
rm -rf /home/$last_user/fitxers/*