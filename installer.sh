#!/bin/sh
# This script will install the AIA NFS Service on your system.

print("AIA NFS Service installer.\n")
print("This script will install the AIA NFS Service on your system.\n\n")

print("Checking for root privileges...")

if [ "$EUID" -ne 0 ]
  then print("Please run this script as root or with sudo.")
  exit
fi

print("Enter the server IP address from the NFS Server: ")
read server_ip

echo "$server_ip:/mnt/fitxers /mnt/nfs nfs defaults 0 0" >> /etc/fstab

print("Installing dependencies...")

apt install nfs-common

print("Installing AIA NFS Service...")

cp src/aianfs.service /etc/systemd/system/aianfs.service
cp src/aianfs.sh /usr/local/bin/aianfs.sh

print("Enabling AIA NFS Service...")

systemctl enable aia-nfs.service

print("Starting AIA NFS Service...")

systemctl start aia-nfs.service

print("Done! AIA NFS Service is now installed.")


