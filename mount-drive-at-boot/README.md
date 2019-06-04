## Mount drive at boot
A fast script to mount a drive when the Raspberry Pi turns on.

### Script
To mount a ntfs partition `/dev/sda1` in `/mnt/usb` at boot just exec my script:
```
curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/mount-drive-at-boot/mount-drive-at-boot.sh | sudo bash
```
Restart the Raspberry Pi to mount the usb drive:
```
sudo reboot
```

#### Important note:
This script mounts a **NTFS** partition **`/dev/sda1`** in `/mnt/usb`. If you need to mount **another partition** (i.e. /dev/sdb3) **or with another filesystem** (i.e. FAT32) download the script and change the bash commands to meet your needs.
