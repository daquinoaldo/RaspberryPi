# Samba share
Share a folder or a drive on the network.

## TL;DR
To share the folder `/mnt/usb` on the network just exec my script.
```
curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/samba-share/samba-share.sh | sudo bash
```

### Custom settings
If you want to access the shared folder without password add this lines at the end of [samba.conf](samba.conf).
```
Public = yes
Guest ok = yes
```

### Important note:
This script shares `/mnt/usb`, that is the folder of the [mounted drive](../mount-drive-at-boot/README.md). If you need to share **another directory** (i.e. `/usr/share`) download the script and change the bash commands or follow the manual instructions on the next section.

Note also that by default the content of the pi's home is shared if you log to samba as pi. You can change this default behavior by editing `/etc/samba/smb.conf`.


## I don’t trust you, show me what to do
You’re right! Never trust random script found on internet!
Here is how to set up the Pi manually.

1. Install samba.
   ```
   sudo apt update
   sudo apt install -y samba samba-common-bin
   ```
2. Backup the configuration file.
   ```
   sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.BAK
   ```
3. Open the samba configuration file
   ```
   sudo nano /etc/samba/smb.conf
   ```
   and append at the end this configuration.
   ```
   [share]
   Comment = Pi shared drive
   Path = /mnt/usb
   Browseable = yes
   Writeable = Yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   ```
   Change `/mnt/usb` with the path you want to share.
4. Add pi as samba user
   ```
   sudo smbpasswd -a pi
   ```
   and type the samba password for pi (I suggest the same of the pi user for simplicity).
5. [optional] If you want to access the shared folder without password add this lines at the end of `/etc/samba/smb.conf`.
   ```
   Public = yes
   Guest ok = yes
   ```
6. [optional] By default the content of the pi's home is shared if you log to samba as pi. You can change this default behavior by editing the respective configuration in the `/etc/samba/smb.conf` (not in the new added part).
7. Restart samba.
   ```
   sudo /etc/init.d/samba restart
   ```
