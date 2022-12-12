#!/bin/bash

# AIA NFS Backup Script
# This script will backup the AIA NFS Service to a network share.

# Copy current user home to backup with timestamp name (e.g. /home/username/alumne-2020-01-01-00-00-00)
cp -r /home/$USER/fitxers /mnt/fitxers/$USER-$(date +%Y-%m-%d-%H-%M-%S)
rm -rf /home/$USER/fitxers/*