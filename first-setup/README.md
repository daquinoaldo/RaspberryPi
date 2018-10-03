## First setup

### Install the OS
1. Choose one of the OS from the [official Raspberry Pi website](https://www.raspberrypi.org/downloads/). I suggest [Raspbian](https://www.raspberrypi.org/downloads/raspbian/), the official Raspberry Pi OS. You can choose the headless version (lite) or the full version (with desktop): I suggest the lite for advanced users and the full version for those who are at the first experience. This tutorial works with both versions, but if you got the desktop version some operation like setup the Wi-Fi can be performed using the GUI (there are lots of tutorial in the web).
2. Download the image (if you have a bittorrent client like uTorrent you can chose “Download Torrent”, faster and preferred way) and unzip the img file. 
3. Burn the image to a micro SD card (you will need an adapter). I suggest to use [Etcher](https://etcher.io/), a multiplatform tool to burn img files to SD cards.

### Set-up Wi-Fi
Once burned the sd card you can see 2 partition: boot and root (Windows users can open only the boot).
Let's focus on boot: we can use this partition to configure the system automatically on first launch.
1. download the [wpa_supplicant.conf](wpa_supplicant.conf) file and edit changing ssid and psk to match the ssid and the password of the network you want to connect. You can also setup more than one network:
```
network={
    ssid="YOUR_WIFI_SSID_1"
    psk="YOUR_WIFI_PASSWORD_1"
    priority=1
}
network={
    ssid="YOUR_WIFI_SSID_2"
    psk="YOUR_WIFI_PASSWORD_2"
    priority=2
}
```
*This will be moved to the /etc/wpa_supplicant/ directory the next time the system is booted, __overwriting the network settings__*, according to [The latest update to Raspbian - Raspberry Pi, 2016-05-13](https://www.raspberrypi.org/blog/another-update-raspbian/).

### Enable SSH
Just put an empty file called `ssh` (without exension) in the boot partition to enable SSH at first boot. Note that the file will be deleted after the first boot but the ssh will remain enabled.
Now you can access via SSH to your Raspberry, but you need tho know the IP address. [Here](https://www.raspberrypi.org/documentation/remote-access/ip-address.md) there is a tutorial from the Raspberry Pi website.
You can access remotely to your Rapberry Pi with `ssh pi@192.168.1.100`, obviously using the right IP instead `192.168.1.100`.

**Windows users:** Windows doesn't have SSH, so you can use [PuTTY](http://www.putty.org/) (the easiest way) or [install WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (Ubuntu on Windows, nice!).

You can reach your Raspberry Pi also with domain **raspberrypi.local**: `ssh pi@raspberrypi.local`. This should work on MacOS and Linux (if not `apt-get install libnss-mdns` should fix), on Windows you need to install [Apple Bonjour](http://support.apple.com/downloads/DL999/en_US/BonjourPSSetup.exe) to make things works.

### Change password
Remember to change the default password for pi! You can do it with the `passwd` command.
