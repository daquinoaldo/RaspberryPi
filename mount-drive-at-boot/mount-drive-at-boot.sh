sudo apt-get update
#sudo apt-get install ntfs-3g
sudo mkdir /mnt/usb
sudo chmod +rx /mnt/usb
#sudo /bin/sh -c 'echo "/dev/sda1 /mnt/usb ntfs-3g defaults 0 0" >> /etc/fstab'
sudo /bin/sh -c 'echo "/dev/sda1 /mnt/usb ntfs defaults 0 0" >> /etc/fstab'
