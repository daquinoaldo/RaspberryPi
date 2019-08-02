# Mount drive at boot
Mount an external drive when the Raspberry Pi turns on. Usefule for a DIY NAS with samba.

I used an NTFS filesystem: it's not the best to use with linux, but it supports file bigger than 4GB and is compatible with Windows (read/write) and MacOS (read-only, read/write with third-part tools like [Tuxera NTFS](https://www.tuxera.com/products/tuxera-ntfs-for-mac/)).

## TL;DR
To mount a ntfs partition `/dev/sda1` in `/mnt/usb` at boot just exec my script and reboot the system.
```
curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/mount-drive-at-boot/mount-drive-at-boot.sh | sudo bash
sudo reboot
```

#### Important note
This script mounts a **NTFS** partition **`/dev/sda1`** in `/mnt/usb`. If you need to mount **another partition** (i.e. /dev/sdb3) **or with another filesystem** (i.e. FAT32) download the script and change the bash commands to meet your needs or follow the instruction in the next section.


## I don't trust you, show me what to do
You're right! Never trust random script found on internet!  
Here is how to set up the Pi manually.

1. [optional] Install ntfs-3g for NTFS drive, you can skip if the drive has another filesystem
   ```
   sudo apt update
   sudo apt install -y ntfs-3g
   ```
2. Prepare the mount point. I chose `/mnt/usb` but you can change it. Usually is a subdirectory of `/mnt` or `/media` for convention.
   ```
   sudo mkdir /mnt/usb
   sudo chmod 1777 /mnt/usb
   ```
3. Edit fstab 
   ```
   nano /etc/fstab
   ```
   and add this line
   ```
   /dev/sda1 /mnt/usb ntfs-3g defaults 0 0
   ```
   where `/dev/sda1 ` is the partition to mount, `/mnt/usb` is the mount point previously created, and `ntfs-3g` is the filesystem (for NTFS, otherwise can be `ext2`, `ext3`, `vfat` for FAT32, `exfat`, etc.).


## Important
The device may not boot if the drive isn't connected. If you want to stop mount the drive at boot remove the last line (the one we added) from `/etc/fstab`.
