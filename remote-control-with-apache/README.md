# Remote control Raspberry Pi with Apache
Supposing you already know how to control relays or other GPIO devices attached to the Raspberry Pi, probably you would like to activate this scripts via web UI.

We will use Apache as web server.

> The Apache HTTP Server [...] is the world's most used web server software.
> – Wikipedia

## Install Apache
```bash
sudo apt update
sudo apt install apache2 apache2-utils php libapache2-mod-php
```

If everything get right, if you open your browser and visit raspberrypi.local (or your Raspberry Pi IP) you can see the Apache2 Debian Default Page. It works! as it says.

This webpage is located in /var/www/html/index.html. Editing this page you can build everything you want, like a local website for example.

## Make Apace execute a shell or python script
```bash
sudo rm /var/www/html/index.html   # remove the default page
sudo nano /var/www/html/index.php  # create and edit the new webpage
```

Now paste (Ctrl + Shift + V) this php script in the editor and save with Ctrl + C.
```php
<?php echo shell_exec ("/home/pi/my-script.sh"); ?>
```

This command execute the bash script (my-script.sh) and print in the webpage everything that the script will print.

In the same way you can execute a python script just replacing `/home/pi/my-script.sh` with `python /home/pi/my-script.py`.

The script is activated every time you visit http://raspberrypi.local (or your Raspberry Pi IP).

## Control GPIO directly through php
Create a file `/var/www/html/on.php`
```php
<?php
system("gpio-g mode 21 out"); // set pin 21 as output pin (out = write, in = read)
system("gpio-g write 21 0");  // set pin 21 to 1 (on)
?>
```
and another `/var/www/html/off.php`
```php
<?php
system("gpio-g mode 21 out"); // set pin 21 as output pin (out = write, in = read)
system("gpio-g write 21 0");  // set pin 21 to 0 (off)
?>
```

Visiting `on.php` will ligth the relay, visiting `off.php` will turn it off.

## Control the Raspberry Pi outside the home network
To control your Raspberry Pi outside the home you have to activate the port forwarding in your router. Each router has a different configuration, so you should google how to do it on your router. Simply forward the port 80 of your router to the port 80 of your raspberry pi IP. I may need to assign a static IP address to the Pi in your router.

Then, using a service for dinamic DNS, such as [NoIP](https://www.noip.com/free) that is free, you can setup your router so that the free domain you choose always points to your home network IP.

### Important: security
If you expose your webserver everyone on the web can activate your script! You must secure the page.

#### Create an .htpasswd file
```bash
sudo htpasswd -c /etc/apache2/.htpasswd <username>
```
Replace `<username>` with an username of your choice. It will ask you to set a password for the user.
You can add other users with `sudo htpasswd /etc/apache2/.htpasswd another_user` (without the `-c` option).

#### Edit the Apache configuration to enable htaccess
```bash
sudo nano /etc/apache2/apache2.conf
```
Look for `<Directory /var/www/>` and change the `AllowOverride` value from `None` to `All`.
```
<Directory /var/www/>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```
Save and exit with Ctrl + X.

#### Create an .htaccess file
```bash
sudo nano /var/www/html/.htaccess
```
Paste this configuration:
```
AuthType Basic
AuthName "Restricted Content"
AuthUserFile /etc/apache2/.htpasswd
Require valid-user
```
Save and exit with Ctrl + X.

#### Restart Apache
```bash
sudo service apache2 restart
```