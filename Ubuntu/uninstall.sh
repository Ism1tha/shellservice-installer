#!/bin/bash
# This script will uninstall the AIA NFS Service from your system.

echo "AIA NFS Service uninstaller.\n"
echo "This script will uninstall the AIA NFS Service from your system."

echo "Checking for root privileges..."

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root or with sudo."
  exit
fi

echo "Uninstalling AIA NFS Service..."

umount /mnt/nfs
systemctl stop aianfs.service

rm /etc/systemd/system/aianfs.service
rm /usr/local/bin/aianfs.sh

sed -i '/mnt\/fitxers \/mnt\/nfs /d' /etc/fstab

echo "Done! AIA NFS Service is now uninstalled."