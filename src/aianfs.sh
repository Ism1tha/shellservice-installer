#!/bin/bash

# AIA NFS Backup Script
# This script will backup the AIA NFS Service to a network share.

# Copy current user home to backup with timestamp name (e.g. /home/username/alumne-2020-01-01-00-00-00)

if [ ! -d "/mnt/nfs/$USER" ]; then
  mkdir /mnt/nfs/$USER
fi

current_date=$(date +%Y-%m-%d-%H-%M-%S)
mkdir /mnt/nfs/$USER/$current_date
cp -r /home/$USER/fitxers/* /mnt/nfs/$USER/$current_date
rm -rf /home/$USER/fitxers/*