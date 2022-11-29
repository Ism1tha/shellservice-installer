#!/bin/sh
# This script will uninstall the AIA NFS Service from your system.

print "AIA NFS Service uninstaller.\n"
print "This script will uninstall the AIA NFS Service from your system.\n\n"

print "Checking for root privileges..."

if [ "$EUID" -ne 0 ]
  then print "Please run this script as root or with sudo."
  exit
fi

print "Uninstalling AIA NFS Service..."

systemctl stop aianfs.service

rm /etc/systemd/system/aianfs.service
rm /usr/local/bin/aianfs.sh

sed -i '/mnt\/fitxers \/mnt\/nfs /d' /etc/fstab

print "Disabling AIA NFS Service..."

systemctl disable aianfs.service

print "Done! AIA NFS Service is now uninstalled."