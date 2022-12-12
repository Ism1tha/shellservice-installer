#!/bin/bash
# This script will install the AIA NFS Service on your system.

echo "AIA NFS Service installer.\n"
echo "This script will install the AIA NFS Service on your system.\n\n"

echo "Checking for root privileges..."

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root or with sudo."
  exit
fi

echo "Enter the server IP address from the NFS Server: "
read server_ip

echo "$server_ip:/mnt/fitxers /mnt/nfs nfs defaults 0 0" >> /etc/fstab

echo "Installing dependencies..."

apt install nfs-common

echo "Installing AIA NFS Service..."

cp src/aianfs.service /etc/systemd/system/aianfs.service
cp src/aianfs.sh /usr/local/bin/aianfs.sh

echo "Enabling AIA NFS Service..."

mount 192.168.1.24:/mnt/fitxers/ /mnt/nfs

systemctl enable aianfs.service

echo "Starting AIA NFS Service..."

systemctl start aianfs.service

echo "Done! AIA NFS Service is now installed."


