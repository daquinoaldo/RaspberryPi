## Samba share
A fast script to share a folder on the network.

### Script
To share the folder `/mnt/usb` on the network just exec my script:
```
curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/samba-share/samba-share.sh | sudo bash
```

#### Important note:
This script shares `/mnt/usb`, that is the folder of the [mounted drive](../mount-drive-at-boot/README.md). If you need to share **another directory** (i.e. `/usr/share`) download the script and change the bash commands to meet your needs.

### Custom settings
If you want to access the shared folder without password add this lines at the end of [samba.conf](samba.conf).
```
Public = yes
Guest ok = yes
```
Note also that by default the content of the pi's home is shared if you log to samba as pi. You can change this default behavior by editing `/etc/samba/smb.conf`.