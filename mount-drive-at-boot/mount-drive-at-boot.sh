sudo apt update
sudo apt install -y ntfs-3g
sudo mkdir /mnt/usb
sudo chmod 1777 /mnt/usb
sudo /bin/sh -c 'echo "/dev/sda1 /mnt/usb ntfs-3g defaults 0 0" >> /etc/fstab'
echo "Set a password for samba:"
sudo smbpasswd -a pi
sudo /etc/init.d/samba restart