## Install Plex Media Server on Raspberry Pi
An easy script to install Plex server also on ARM architecture like Raspberry pi.

### Read carefully
Note that the debian package is NOT provided by Plex, because the official one does not support ARM. Thanks to [Dev2Dev](https://dev2day.de) for the porting.
Note also that only ARMv7 devices are supported (Pi 2 and 3) and not ARMv6 (Pi 1 mod. A, Pi 1 mod. B, Pi zero, Pi Zero W).

### Install
Just exec my script:
`curl https://raw.githubusercontent.com/daquinoaldo/RaspberryPi/master/plexmediaserver/plexserver.sh | sudo bash`

### Important note
THE SCRIPT IS UNDER TESTING. IT IS NOT SURE THAT IT WORKS! IF YOU TEST PLEASE LET ME KNOW.
