sudo apt update
sudo apt install -y samba samba-common-bin
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.BAK
sudo /bin/sh -c 'curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/samba-share/samba.conf >> /etc/samba/smb.conf'
echo "Set a password for samba:"	
sudo smbpasswd -a pi	
sudo /etc/init.d/samba restart
